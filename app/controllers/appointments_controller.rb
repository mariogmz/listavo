# frozen_string_literal: true

class AppointmentsController < ApplicationController
  layout "public"
  before_action :set_user!

  def new
    @patient = @user.patients.new
    @invite_token = invite_token
  end

  def create
  end

  private

    def invite_token
      params[:invite_token]
    end

    def set_user!
      @user = User.find_by!(invite_token: invite_token)
    end
end
