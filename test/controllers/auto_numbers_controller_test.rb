require 'test_helper'

class AutoNumbersControllerTest < ActionController::TestCase
  setup do
    @auto_number = auto_numbers(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:auto_numbers)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create auto_number' do
    assert_difference('AutoNumber.count') do
      post :create, params: { auto_number: {
          entry_date: @auto_number.entry_date,
          name: { initials: @auto_number.name.initials },
          repository: { name: @auto_number.repository.name }
        }
      }
    end

    assert_redirected_to auto_number_path(assigns(:auto_number))
  end

  test 'should show auto_number' do
    get :show, params: { id: @auto_number }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @auto_number }
    assert_response :success
  end

  test 'should update auto_number' do
    patch :update, params: { id: @auto_number, auto_number: {
        entry_date: @auto_number.entry_date,
        name: { initials: @auto_number.name.initials },
        repository: { name: @auto_number.repository.name }
      }
    }
    assert_redirected_to auto_number_path(assigns(:auto_number))
  end

  test 'should destroy auto_number' do
    assert_difference('AutoNumber.count', -1) do
      delete :destroy, params: { id: @auto_number }
    end

    assert_redirected_to auto_numbers_path
  end
end
