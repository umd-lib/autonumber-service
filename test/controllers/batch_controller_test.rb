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
      post :create, params: { batch: {
          entry_date: @auto_number.entry_date,
          name_initials: @auto_number.name.initials,
          repository_name: @auto_number.repository.name,
          quantity: quantity_to_add
        }
      }
    end

    assert_redirected_to batch_path
  end

  test 'require name' do
    assert_difference('AutoNumber.count', 0) do
      post :create, params: { batch: {
          entry_date: @auto_number.entry_date,
          repository_name: @auto_number.repository.name,
          quantity: 10
        }
      }
    end
    assert flash[:errors].include?('Name is required')
  end

  test 'require repository' do
    assert_difference('AutoNumber.count', 0) do
      post :create, params: { batch: {
          entry_date: @auto_number.entry_date,
          name_initials: @auto_number.name.initials,
          quantity: 10
        }
      }
    end
    assert flash[:errors].include?('Repository is required')
  end

  test 'require non-nil quantity' do
    assert_difference('AutoNumber.count', 0) do
      post :create, params: { batch: {
          entry_date: @auto_number.entry_date,
          name_initials: @auto_number.name.initials,
          repository_name: @auto_number.repository.name
      }
    }
    end
    assert flash[:errors].include?('Quantity must be greater than 0')
  end

  test 'require non-negative quantity' do
    assert_difference('AutoNumber.count', 0) do
      post :create, params: { batch: {
          entry_date: @auto_number.entry_date,
          name_initials: @auto_number.name.initials,
          repository_name: @auto_number.repository.name,
          quantity: -10
        }
      }
    end
    assert flash[:errors].include?('Quantity must be greater than 0')
  end
end
