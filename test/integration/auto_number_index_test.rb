require 'test_helper'

# Integration test for the Auto Numbers index
class AutoNumberIndexTest < ActionDispatch::IntegrationTest
  test 'index including pagination' do
    get auto_numbers_path
    assert_template 'auto_numbers/index'
    assert_select '.pagination'
    AutoNumber.paginate(page: 1).each do |auto_number|
      assert_select 'a[href=?]', auto_number_path(auto_number), text: auto_number.id.to_s
    end
  end

  test 'index including pagination and sorting' do
    columns = %w[id entry_date name_initials repository_name]
    columns.each do |column|
      %w[asc desc].each do |order|
        q_param = { s: "#{column} #{order}" }
        get auto_numbers_path, params: { q: q_param }
        assert_template 'auto_numbers/index'
        assert_select '.pagination'
        AutoNumber.ransack(q_param).result.paginate(page: 1).each do |auto_number|
          assert_select 'a[href=?]', auto_number_path(auto_number), text: auto_number.id.to_s
        end
      end
    end
  end

  test 'index should include web accessibility link' do
    get auto_numbers_path
    assert_template 'auto_numbers/index'
    assert_select 'a[href=?]', 'https://umd.edu/web-accessibility'
  end
end
