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

  test "#update: snooze" do
    Enqueue.any_instance.expects(:snooze!).returns(true).once
    Enqueue.any_instance.expects(:book!).never

    put appointment_url(@enqueue, params: { snooze: true })

    assert_nil(flash[:error])
    assert_equal(I18n.t("enqueues.update.snoozed"), flash[:success])
    assert_redirected_to(appointments_url)
  end

  test "#update: book" do
    Enqueue.any_instance.expects(:snooze!).never
    Enqueue.any_instance.expects(:book!).returns(true).once

    put appointment_url(@enqueue, params: { book: true })

    assert_nil(flash[:error])
    assert_equal(I18n.t("enqueues.update.booked"), flash[:success])
    assert_redirected_to(appointments_url)
  end

  test "#update fails" do
    Enqueue.any_instance.expects(:snooze!).never
    Enqueue.any_instance.expects(:book!).never

    put appointment_url(@enqueue, params: {})

    assert_nil(flash[:success])
    assert_equal(I18n.t("enqueues.update.error"), flash[:error])
    assert_redirected_to(appointments_url)
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
