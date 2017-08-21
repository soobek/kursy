require 'test_helper'

class StronasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get pokaz" do
    get :pokaz
    assert_response :success
  end

  test "should get nowa" do
    get :nowa
    assert_response :success
  end

  test "should get edycja" do
    get :edycja
    assert_response :success
  end

  test "should get usun" do
    get :usun
    assert_response :success
  end

end
