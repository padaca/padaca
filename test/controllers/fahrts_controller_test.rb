require 'test_helper'

class FahrtsControllerTest < ActionController::TestCase
  setup do
    @fahrt = fahrts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fahrts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fahrt" do
    assert_difference('Fahrt.count') do
      post :create, fahrt: { account_id: @fahrt.account_id, dauer: @fahrt.dauer, maxMitfahrer: @fahrt.maxMitfahrer, nach: @fahrt.nach, preisProMitfahrer: @fahrt.preisProMitfahrer, von: @fahrt.von }
    end

    assert_redirected_to fahrt_path(assigns(:fahrt))
  end

  test "should show fahrt" do
    get :show, id: @fahrt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fahrt
    assert_response :success
  end

  test "should update fahrt" do
    patch :update, id: @fahrt, fahrt: { account_id: @fahrt.account_id, dauer: @fahrt.dauer, maxMitfahrer: @fahrt.maxMitfahrer, nach: @fahrt.nach, preisProMitfahrer: @fahrt.preisProMitfahrer, von: @fahrt.von }
    assert_redirected_to fahrt_path(assigns(:fahrt))
  end

  test "should destroy fahrt" do
    assert_difference('Fahrt.count', -1) do
      delete :destroy, id: @fahrt
    end

    assert_redirected_to fahrts_path
  end
end
