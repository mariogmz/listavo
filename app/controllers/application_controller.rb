# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def index
    redirect_to administrator_root_path if current_admin
  end
end
