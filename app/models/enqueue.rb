# frozen_string_literal: true

class Enqueue < ApplicationRecord
  TABLE_HEADERS = %w(patient_name patient_phone patient_email shift due_date).freeze

  belongs_to :user, inverse_of: :enqueues
  belongs_to :patient, inverse_of: :enqueue, dependent: :destroy

  scope :booked, -> { where.not(booked_at: nil) }
  scope :pending, -> { where(booked_at: nil) }

  def next_notification_date
    return nil if booked_at.present?

    updated_at + user.notification_days.days
  end

  def due?
    return false if next_notification_date.nil?

    Time.current > next_notification_date
  end

  def book!
    self.booked_at = Time.current
    save!(touch: false)
  end

  def unbook!
    self.booked_at = nil
    save!(touch: false)
  end

  def snooze!
    touch(:updated_at)
  end
end
