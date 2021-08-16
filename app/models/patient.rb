# frozen_string_literal: true

class Patient < ApplicationRecord
  enum shift: {
    morning: 0,
    afternoon: 1,
    evening: 2,
  }, _prefix: true

  validates_presence_of :name, :phone, :shift
  validates_inclusion_of :shift, in: shifts.keys

  has_one :enqueue
end
