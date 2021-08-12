# frozen_string_literal: true

module Accesible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
    def check_user
      if current_admin
        flash.clear
        redirect_to(administrator_root_path) and return
      elsif current_user
        flash.clear
        redirect_to(root_path) and return
      end
    end
end
