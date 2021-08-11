class Patient < ApplicationRecord
  enum shift: {
    morning: 0,
    afternoon: 1,
    evening: 2,
  }, _prefix: true

  has_one :enqueue
end
