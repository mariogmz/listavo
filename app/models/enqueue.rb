# frozen_string_literal: true

class Enqueue < ApplicationRecord
  belongs_to :user, inverse_of: :enqueues
  belongs_to :patient, inverse_of: :enqueue

  def next_notification_date
    (booked_at || created_at) + user.notification_days
  end
end
