require 'test_helper'

class UzytkowniksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get nowy" do
    get :nowy
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
