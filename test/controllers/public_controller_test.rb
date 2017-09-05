require 'test_helper'

class PublicControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get artykuly" do
    get :artykuly
    assert_response :success
  end

  test "should get galerie" do
    get :galerie
    assert_response :success
  end

  test "should get kategorie" do
    get :kategorie
    assert_response :success
  end

  test "should get nowosci" do
    get :nowosci
    assert_response :success
  end

  test "should get strona" do
    get :strona
    assert_response :success
  end

end
