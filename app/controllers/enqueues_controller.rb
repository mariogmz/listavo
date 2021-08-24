# frozen_string_literal: true

class EnqueuesController < ApplicationController
  before_action :authenticate_user!

  def index
    @appointments = current_user.enqueues.includes(:patient)
  end
end
