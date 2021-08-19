# frozen_string_literal: true

require "test_helper"

class EnqueueTest < ActiveSupport::TestCase
  context "validations" do
    should belong_to(:user)
    should belong_to(:patient)
  end
end
