require 'test_helper'

class SeoResultsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seo_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seo_result" do
    assert_difference('SeoResult.count') do
      post :create, :seo_result => { }
    end

    assert_redirected_to seo_result_path(assigns(:seo_result))
  end

  test "should show seo_result" do
    get :show, :id => seo_results(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => seo_results(:one).id
    assert_response :success
  end

  test "should update seo_result" do
    put :update, :id => seo_results(:one).id, :seo_result => { }
    assert_redirected_to seo_result_path(assigns(:seo_result))
  end

  test "should destroy seo_result" do
    assert_difference('SeoResult.count', -1) do
      delete :destroy, :id => seo_results(:one).id
    end

    assert_redirected_to seo_results_path
  end
end
