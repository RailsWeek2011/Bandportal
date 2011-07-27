require 'test_helper'

class TendersControllerTest < ActionController::TestCase
  setup do
    @tender = tenders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tenders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tender" do
    assert_difference('Tender.count') do
      post :create, tender: @tender.attributes
    end

    assert_redirected_to tender_path(assigns(:tender))
  end

  test "should show tender" do
    get :show, id: @tender.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tender.to_param
    assert_response :success
  end

  test "should update tender" do
    put :update, id: @tender.to_param, tender: @tender.attributes
    assert_redirected_to tender_path(assigns(:tender))
  end

  test "should destroy tender" do
    assert_difference('Tender.count', -1) do
      delete :destroy, id: @tender.to_param
    end

    assert_redirected_to tenders_path
  end
end
