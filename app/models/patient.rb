# frozen_string_literal: true

class Patient < ApplicationRecord
  enum shift: {
    morning: 0,
    evening: 1,
    saturday: 2,
  }, _prefix: true

  validates_presence_of :name, :phone, :shift
  validates_inclusion_of :shift, in: shifts.keys
  validates_uniqueness_of :phone, case_sensitive: false
  validates_length_of :phone, in: 7..13
  validates_uniqueness_of :email, case_sensitive: false, allow_blank: true

  has_one :enqueue
end
