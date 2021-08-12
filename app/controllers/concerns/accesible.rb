# frozen_string_literal: true

module Accesible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected

  def check_user
    flash.clear

    redirect_to(administrator_root_path) and return if current_admin
    redirect_to(root_path) and return if current_user
  end
end
