# frozen_string_literal: true

require "test_helper"

class EnqueuesControllerTest < ActionDispatch::IntegrationTest
  attr_accessor :user

  setup do
    @user = users(:user)
    sign_in(@user)
  end

  test "#index" do
    get appointments_url

    assert_response(:success)
    assert_not_nil(assigns[:appointments])
  end
end
