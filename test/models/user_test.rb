# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  context "validations" do
    subject { users(:user) }

    should validate_presence_of(:email)
    should validate_presence_of(:name)
    should validate_presence_of(:phone)
    should validate_presence_of(:notification_days)
    should validate_uniqueness_of(:email).ignoring_case_sensitivity
    should validate_uniqueness_of(:phone).ignoring_case_sensitivity
    should have_many(:enqueues)
    should have_many(:patients)
  end
end
