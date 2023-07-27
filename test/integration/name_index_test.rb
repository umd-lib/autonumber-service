require 'test_helper'

# Integration test for the Names index
class NameIndexTest < ActionDispatch::IntegrationTest
  test 'index including pagination' do
    get names_path
    assert_template 'names/index'
    assert_select '.pagination'
    # use the default sort column & order
    Name.ransack(s: 'initials asc').result.paginate(page: 1).each do |name|
      assert_select 'a[href=?]', name_path(name), text: name.initials
    end
  end

  test 'index including pagination and sorting' do
    column = 'initials'
    %w(asc desc).each do |order|
      q_param = { s: column + ' ' + order }
      get names_path, params: { q: q_param }
      assert_template 'names/index'
      assert_select '.pagination'
      Name.ransack(q_param).result.paginate(page: 1).each do |name|
        assert_select 'a[href=?]', name_path(name), text: name.initials
      end
    end
  end
end
