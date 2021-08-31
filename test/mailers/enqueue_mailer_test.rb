# frozen_string_literal: true

require "test_helper"

class EnqueueMailerTest < ActionMailer::TestCase
  setup do
    @enqueue = enqueues(:patient1)
    @enqueue.booked_at = nil
    @user = users(:user)
  end

  test "#new_patient_email" do
    email = EnqueueMailer.new_patient_email(@enqueue)

    assert_emails(1) do
      email.deliver_now
    end

    assert_equal([@enqueue.user.email], email.to)
    assert_equal(I18n.t("enqueue_mailer.new_patient_email.subject", name: @enqueue.patient.name), email.subject)
  end

  test "#notify_patient_dues_email" do
    email = EnqueueMailer.notify_patient_dues_email(@user)

    assert_emails(1) do
      email.deliver_now
    end

    assert_equal([@user.email], email.to)
    assert_equal(I18n.t("enqueue_mailer.notify_patient_dues_email.subject"), email.subject)
  end
end
