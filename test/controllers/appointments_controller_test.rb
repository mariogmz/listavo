# frozen_string_literal: true

require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user)
  end

  test "should get new" do
    get new_patients_appointment_url(invite_token: @user.invite_token)
    assert_response(:success)

    assert_equal(@user, assigns[:user])
    assert_equal(@user.invite_token, assigns[:invite_token])
    assert_not_nil(assigns[:patient])
  end
end
