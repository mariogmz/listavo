# frozen_string_literal: true

require "test_helper"

class EnqueueMailerTest < ActionMailer::TestCase
  setup do
    @enqueue = enqueues(:patient1)
    @enqueue.booked_at = nil
  end

  test "#new_patient_email" do
    email = EnqueueMailer.new_patient_email(@enqueue)

    assert_emails(1) do
      email.deliver_now
    end

    assert_equal([@enqueue.user.email], email.to)
    assert_equal(I18n.t("enqueue_mailer.new_patient_email.subject", name: @enqueue.patient.name), email.subject)
  end
end
