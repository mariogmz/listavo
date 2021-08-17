# frozen_string_literal: true

class InviteLinksController < ApplicationController
  before_action :authenticate_user!

  def show
    @invite_link = current_user.invite_link
  end
end
