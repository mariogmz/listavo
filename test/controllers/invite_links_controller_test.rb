# frozen_string_literal: true

require "test_helper"

class InviteLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:user)
  end

  test "should get show" do
    get invite_link_url
    assert_response :success
    assert_not_nil assigns(:invite_link)
  end
end
