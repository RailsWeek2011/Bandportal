require 'test_helper'

class UnregisteredUsersControllerTest < ActionController::TestCase
  setup do
    @unregistered_user = unregistered_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unregistered_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unregistered_user" do
    assert_difference('UnregisteredUser.count') do
      post :create, unregistered_user: @unregistered_user.attributes
    end

    assert_redirected_to unregistered_user_path(assigns(:unregistered_user))
  end

  test "should show unregistered_user" do
    get :show, id: @unregistered_user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unregistered_user.to_param
    assert_response :success
  end

  test "should update unregistered_user" do
    put :update, id: @unregistered_user.to_param, unregistered_user: @unregistered_user.attributes
    assert_redirected_to unregistered_user_path(assigns(:unregistered_user))
  end

  test "should destroy unregistered_user" do
    assert_difference('UnregisteredUser.count', -1) do
      delete :destroy, id: @unregistered_user.to_param
    end

    assert_redirected_to unregistered_users_path
  end
end
