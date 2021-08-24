# frozen_string_literal: true

class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:show]

  def show
  end

  private

    def set_patient
      @patient = current_user.patients.find(params[:id])
    end
end
