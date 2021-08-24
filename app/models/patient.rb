# frozen_string_literal: true

class Patient < ApplicationRecord
  enum shift: {
    morning: 0,
    afternoon: 1,
    evening: 2,
    saturday: 3,
  }, _prefix: true

  validates_presence_of :name, :phone, :shift
  validates_inclusion_of :shift, in: shifts.keys
  validates_uniqueness_of :phone, case_sensitive: false
  validates_uniqueness_of :email, case_sensitive: false, allow_blank: true

  has_one :enqueue
end
