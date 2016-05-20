require 'test_helper'

class LikesControllerTest < ActionController::TestCase
  test "should get taste" do
    get :taste
    assert_response :success
  end

  test "should get favorite" do
    get :favorite
    assert_response :success
  end

  test "should get rate" do
    get :rate
    assert_response :success
  end

end
