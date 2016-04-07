require 'test_helper'

class AutoNumberIndexTest < ActionDispatch::IntegrationTest
  test "index including pagination" do
    get auto_numbers_path
    assert_template 'auto_numbers/index'
    assert_select 'div.pagination'
    AutoNumber.paginate(page: 1).each do |auto_number|
      assert_select 'a[href=?]', auto_number_path(auto_number), text: 'Show'
    end
  end
end
