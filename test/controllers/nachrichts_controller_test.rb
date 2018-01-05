require 'test_helper'

class NachrichtsControllerTest < ActionController::TestCase
  setup do
    @nachricht = nachrichts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nachrichts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nachricht" do
    assert_difference('Nachricht.count') do
      post :create, nachricht: { empfaenger_id: @nachricht.empfaenger_id, nachricht: @nachricht.nachricht, sender_id: @nachricht.sender_id }
    end

    assert_redirected_to nachricht_path(assigns(:nachricht))
  end

  test "should show nachricht" do
    get :show, id: @nachricht
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nachricht
    assert_response :success
  end

  test "should update nachricht" do
    patch :update, id: @nachricht, nachricht: { empfaenger_id: @nachricht.empfaenger_id, nachricht: @nachricht.nachricht, sender_id: @nachricht.sender_id }
    assert_redirected_to nachricht_path(assigns(:nachricht))
  end

  test "should destroy nachricht" do
    assert_difference('Nachricht.count', -1) do
      delete :destroy, id: @nachricht
    end

    assert_redirected_to nachrichts_path
  end
end
