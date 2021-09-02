# frozen_string_literal: true

class EnqueuesController < ApplicationController
  before_action :authenticate_user!

  def index
    appointments = current_user.enqueues.includes(:patient)
    @booked = appointments.booked
    @pending = appointments - @booked
  end

  def update
    enqueue = current_user.enqueues.find(enqueue_id)

    flash[:success] = t(".snoozed") if snooze? && enqueue.snooze!
    flash[:success] = t(".booked") if book? && enqueue.book!
    flash[:success] = t(".unbooked") if unbook? && enqueue.unbook!

    flash[:error] = t(".error") if flash[:success].nil?

    redirect_to(appointments_path)
  end

  def destroy
    if current_user.enqueues.find_by(id: enqueue_id).try(:destroy)
      flash[:success] = t(".success")
    else
      flash[:error] = t(".error")
    end

    redirect_to(appointments_path)
  end

  private

    def enqueue_id
      params[:id]
    end

    def snooze?
      params[:snooze].present?
    end

    def book?
      params[:book].present?
    end

    def unbook?
      params[:unbook].present?
    end
end
