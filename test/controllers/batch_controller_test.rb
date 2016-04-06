require 'test_helper'

class BatchControllerTest < ActionController::TestCase
  setup do
    @auto_number = auto_numbers(:one)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create auto_number batch' do
    quantity_to_add = 10
    assert_difference('AutoNumber.count', quantity_to_add) do
      post :create, batch: {
        entry_date: @auto_number.entry_date,
        name_id: @auto_number.name_id,
        repository_id: @auto_number.repository_id,
        quantity: quantity_to_add
      }
    end

    assert_redirected_to batch_path
  end

  test 'require non-nil quantity' do
    assert_difference('AutoNumber.count', 0) do
      post :create, batch: {
        entry_date: @auto_number.entry_date,
        name_id: @auto_number.name_id,
        repository_id: @auto_number.repository_id
      }
    end
    assert_equal 'Quantity must be greater than 0', flash[:error]
  end

  test 'require non-negative quantity' do
    assert_difference('AutoNumber.count', 0) do
      post :create, batch: {
        entry_date: @auto_number.entry_date,
        name_id: @auto_number.name_id,
        repository_id: @auto_number.repository_id,
        quantity: -10
      }
    end
    assert_equal 'Quantity must be greater than 0', flash[:error]
  end
end
