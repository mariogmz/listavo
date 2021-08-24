# frozen_string_literal: true

class EnqueuesController < ApplicationController
  before_action :authenticate_user!

  def index
    @appointments = current_user.enqueues.includes(:patient)
  end

  def destroy
    if current_user.enqueues.find_by(id: params[:id]).try(:destroy)
      flash[:success] = t(".success")
    else
      flash[:error] = t(".error")
    end

    redirect_to(appointments_path)
  end
end
