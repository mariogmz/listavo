# frozen_string_literal: true

require "test_helper"

class EnqueuesControllerTest < ActionDispatch::IntegrationTest
  attr_accessor :user

  setup do
    @user = users(:user)
    @enqueue = @user.enqueues.first
    sign_in(@user)
  end

  test "#index" do
    get appointments_url

    assert_response(:success)
    assert_not_nil(assigns[:appointments])
  end

  test "#destroy is successful" do
    assert_difference ->{ @user.enqueues.count } => -1, ->{ Patient.count } => -1 do
        delete appointment_url(@enqueue)
    end
    assert_equal(I18n.t("enqueues.destroy.success"), flash[:success])
    assert_redirected_to(appointments_url)
  end

  test "#destroy fails" do
    delete appointment_url(100)

    assert_equal(I18n.t("enqueues.destroy.error"), flash[:error])
    assert_redirected_to(appointments_url)
  end
end
