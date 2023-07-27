require 'test_helper'

class NamesControllerTest < ActionController::TestCase
  setup do
    @name = names(:one)
    @name.initials += 'foo'
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
      post :create, params: { name: { initials: @name.initials } }
    end

    assert_redirected_to name_path(assigns(:name))
  end

  test 'should show name' do
    get :show, params: { id: @name }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @name }
    assert_response :success
  end

  test 'should update name' do
    patch :update, params: { id: @name, name: { initials: @name.initials } }
    assert_redirected_to name_path(assigns(:name))
  end

  test 'should not destroy name with auto_numbers' do
    assert_difference('Name.count', 0) do
      delete :destroy, params: { id: @name }
    end

    assert_redirected_to names_path
  end

  test 'should destroy name without auto_numbers' do
    new_name = Name.create(initials: 'pme')

    assert_difference('Name.count', -1) do
      delete :destroy, params: { id: new_name }
    end

    assert_redirected_to names_path
  end
end
