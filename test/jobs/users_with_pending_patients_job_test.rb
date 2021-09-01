# frozen_string_literal: true

require "test_helper"

class UsersWithPendingPatientsJobTest < ActiveJob::TestCase
  attr_reader :subject, :user

  setup do
    @subject = UsersWithPendingPatientsJob
    @user = users(:user)

    @user.enqueues.update_all(
      booked_at: nil,
      updated_at: Time.current - (@user.notification_days + 1).days,
    )
  end

  test "enqueues PendingAppointmentsNotificationJobs" do
    assert_enqueued_jobs(1, only: PendingAppointmentsNotificationJob) do
      subject.perform_now
    end
  end
end
