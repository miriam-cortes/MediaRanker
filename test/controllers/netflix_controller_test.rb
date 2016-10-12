require 'test_helper'

class NetflixControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: netflixes(:movieone).id }
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, {id: netflixes(:movieone).id}
    assert_response :success
  end

  test "should be able to create" do
    post_params = { netflix: {name: "movie3", description: "a movie suggestion", genre: "comedy"} }
    post :create, post_params
    assert_response :redirect
  end

  test "creating a new show changes the number of shows" do
    assert_difference("Netflix.count", 1) do
      post_params = { netflix: {name: "another movie", description: "a movie suggestion", genre: "comedy"} }
      post :create, post_params
    end
  end

  test "should be able to update a movie" do
    patch :update, :id => netflixes(:movieone), :netflix => {description: "a movie suggestion"}
    assert_equal "a movie suggestion", assigns(:netflix).description
    assert_response :success
  end

  test "should be able to delete" do
    post_params = { netflix: {name: "netflix1"} }
    delete :destroy, {id: netflixes(:movieone).id}
    assert_response :redirect
  end

  test "should be able to delete movieone" do
    assert_difference("Netflix.count", -1) do
      delete :destroy, { id: netflixes(:movieone).id }
    end
  end

end
