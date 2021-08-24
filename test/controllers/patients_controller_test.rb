# frozen_string_literal: true

require "test_helper"

class PatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user)
    @patient = @user.patients.first

    sign_in(@user)
  end

  test "should get show" do
    get invite_link_url
    assert_response :success
    assert_not_nil assigns(:invite_link)
  end
end
