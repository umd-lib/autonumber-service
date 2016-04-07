require 'test_helper'

class RepositoryIndexTest < ActionDispatch::IntegrationTest
  test "index including pagination" do
    get repositories_path
    assert_template 'repositories/index'
    assert_select 'div.pagination'
    Repository.paginate(page: 1).each do |repository|
      assert_select 'a[href=?]', repository_path(repository), text: 'Show'
    end
  end
end
