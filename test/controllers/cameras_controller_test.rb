require 'test_helper'

class CamerasControllerTest < ActionController::TestCase
  setup do
    @camera = FactoryGirl.create(:camera)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cameras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create camera" do
    assert_difference('Camera.count') do
      post :create, camera: { name: @camera.name, password: @camera.password, privacy: @camera.privacy, url: @camera.url, username: @camera.username }
    end

    assert_redirected_to camera_path(assigns(:camera))
  end

  test "should show camera" do
    get :show, id: @camera
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @camera
    assert_response :success
  end

  test "should update camera" do
    patch :update, id: @camera, camera: { name: @camera.name, password: @camera.password, privacy: @camera.privacy, url: @camera.url, username: @camera.username }
    assert_redirected_to camera_path(assigns(:camera))
  end

  test "should destroy camera" do
    assert_difference('Camera.count', -1) do
      delete :destroy, id: @camera
    end

    assert_redirected_to cameras_path
  end
end