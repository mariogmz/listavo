# frozen_string_literal: true

class Enqueue < ApplicationRecord
  belongs_to :user, inverse_of: :enqueues
  belongs_to :patient, inverse_of: :enqueue
end
