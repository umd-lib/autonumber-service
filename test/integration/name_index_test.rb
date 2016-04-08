require 'test_helper'

# Integration test for the Names index
class NameIndexTest < ActionDispatch::IntegrationTest
  test 'index including pagination' do
    get names_path
    assert_template 'names/index'
    assert_select '.pagination'
    Name.paginate(page: 1).each do |name|
      assert_select 'a[href=?]', name_path(name), text: name.initials
    end
  end
end
