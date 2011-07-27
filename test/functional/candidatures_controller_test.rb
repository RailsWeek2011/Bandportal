require 'test_helper'

class CandidaturesControllerTest < ActionController::TestCase
  setup do
    @candidature = candidatures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidatures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidature" do
    assert_difference('Candidature.count') do
      post :create, candidature: @candidature.attributes
    end

    assert_redirected_to candidature_path(assigns(:candidature))
  end

  test "should show candidature" do
    get :show, id: @candidature.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candidature.to_param
    assert_response :success
  end

  test "should update candidature" do
    put :update, id: @candidature.to_param, candidature: @candidature.attributes
    assert_redirected_to candidature_path(assigns(:candidature))
  end

  test "should destroy candidature" do
    assert_difference('Candidature.count', -1) do
      delete :destroy, id: @candidature.to_param
    end

    assert_redirected_to candidatures_path
  end
end
