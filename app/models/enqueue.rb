# frozen_string_literal: true

class Enqueue < ApplicationRecord
  belongs_to :user
  belongs_to :patient
end
