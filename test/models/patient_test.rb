# frozen_string_literal: true

require "test_helper"

class PatientTest < ActiveSupport::TestCase
  context "validations" do
    subject { patients(:patient1) }

    should validate_presence_of(:name)
    should validate_presence_of(:phone)
    should validate_presence_of(:shift)
    should define_enum_for(:shift).with_values(
      morning: 0,
      afternoon: 1,
      evening: 2,
    ).with_prefix(true)
    should validate_uniqueness_of(:email).case_insensitive
    should validate_uniqueness_of(:phone).case_insensitive

    should have_one(:enqueue)
  end
end
