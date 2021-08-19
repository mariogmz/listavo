# frozen_string_literal: true

class AppointmentsController < ApplicationController
  layout "public"
  before_action :set_user!
  before_action :set_token!

  def new
    @patient = @user.patients.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save && @user.enqueues.create(patient: @patient)
      render "thanks"
    else
      flash[:error] = @patient.errors.full_messages.join("\n")
      redirect_to new_patients_appointment_path(invite_token: invite_token)
    end
  end

  private

    def invite_token
      params[:invite_token]
    end

    def set_user!
      @user = User.find_by!(invite_token: invite_token)
    end

    def set_token!
      @invite_token = invite_token
    end

    def patient_params
      params.require(:patient).permit(
        :name, :email, :phone, :shift
      )
    end
end
