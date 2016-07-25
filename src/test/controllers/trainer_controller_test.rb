require 'test_helper'

class TrainerControllerTest < ActionController::TestCase
  test "should get list" do
    get :list
    assert_response :success
  end

end
