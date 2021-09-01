# frozen_string_literal: true

require "test_helper"

class PendingAppointmentsNotificationJobTest < ActiveJob::TestCase
  include ActionMailer::TestHelper

  attr_reader :subject, :user

  setup do
    @subject = PendingAppointmentsNotificationJob
    @user = users(:user)
  end

  test "patient due notification mail is sent" do
    assert_emails(1) do
      subject.perform_now(user.id)
    end
  end
end
