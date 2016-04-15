require 'test_helper'

class NamesControllerTest < ActionController::TestCase
  setup do
    @name = names(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:names)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create name' do
    assert_difference('Name.count') do
      post :create, name: { initials: @name.initials }
    end

    assert_redirected_to name_path(assigns(:name))
  end

  test 'should show name' do
    get :show, id: @name
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @name
    assert_response :success
  end

  test 'should update name' do
    patch :update, id: @name, name: { initials: @name.initials }
    assert_redirected_to name_path(assigns(:name))
  end

  test 'should not destroy name with auto_numbers' do
    assert_difference('Name.count', 0) do
      delete :destroy, id: @name
    end

    assert_redirected_to names_path
  end

  test 'should destroy name without auto_numbers' do
    new_name = Name.create(initials: 'pme')

    assert_difference('Name.count', -1) do
      delete :destroy, id: new_name
    end

    assert_redirected_to names_path
  end
end
