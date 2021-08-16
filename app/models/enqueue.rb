# frozen_string_literal: true

class Enqueue < ApplicationRecord
  validates_presence_of :booked_at

  belongs_to :user
  belongs_to :patient
end
