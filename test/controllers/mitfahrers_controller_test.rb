require 'test_helper'

class MitfahrersControllerTest < ActionController::TestCase
  setup do
    @mitfahrer = mitfahrers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mitfahrers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mitfahrer" do
    assert_difference('Mitfahrer.count') do
      post :create, mitfahrer: { account_id: @mitfahrer.account_id, fahrerbewertung: @mitfahrer.fahrerbewertung, fahrt_id: @mitfahrer.fahrt_id, istBestatigt: @mitfahrer.istBestatigt, mitfahrerbewertung: @mitfahrer.mitfahrerbewertung }
    end

    assert_redirected_to mitfahrer_path(assigns(:mitfahrer))
  end

  test "should show mitfahrer" do
    get :show, id: @mitfahrer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mitfahrer
    assert_response :success
  end

  test "should update mitfahrer" do
    patch :update, id: @mitfahrer, mitfahrer: { account_id: @mitfahrer.account_id, fahrerbewertung: @mitfahrer.fahrerbewertung, fahrt_id: @mitfahrer.fahrt_id, istBestatigt: @mitfahrer.istBestatigt, mitfahrerbewertung: @mitfahrer.mitfahrerbewertung }
    assert_redirected_to mitfahrer_path(assigns(:mitfahrer))
  end

  test "should destroy mitfahrer" do
    assert_difference('Mitfahrer.count', -1) do
      delete :destroy, id: @mitfahrer
    end

    assert_redirected_to mitfahrers_path
  end
end
