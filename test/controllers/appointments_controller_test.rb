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

  test "should create a new patient and enqueue for user" do
    assert_difference ->{ @user.enqueues.count } => 1 do
      post patients_appointments_url(invite_token: @user.invite_token), params: { patient: patient_params }
    end

    assert_response :success
  end

  test "should show error messages on creation" do
    assert_no_difference("Patient.count") do
      post patients_appointments_url(invite_token: @user.invite_token), params: { patient: patient_params.except(:name) }
    end

    assert_redirected_to new_patients_appointment_url(invite_token: @user.invite_token)
    assert_not_nil(flash[:error])
  end

  private

    def patient_params
      {
        name: "New Patient",
        email: "new_patient@test.com",
        phone: "4495689452",
        shift: Patient.shifts.keys.sample,
      }
    end
end
