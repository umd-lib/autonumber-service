require 'test_helper'

# Integration test for the Repositories index
class RepositoryIndexTest < ActionDispatch::IntegrationTest
  test 'index including pagination' do
    get repositories_path
    assert_template 'repositories/index'
    assert_select '.pagination'
    Repository.paginate(page: 1).each do |repository|
      assert_select 'a[href=?]', repository_path(repository), text: repository.name
    end
  end

  test 'index including pagination and sorting' do
    column = 'name'
    %w(asc desc).each do |order|
      q_param = { s: column + ' ' + order }
      get repositories_path, q: q_param
      assert_template 'repositories/index'
      assert_select '.pagination'
      Repository.ransack(q_param).result.paginate(page: 1).each do |repository|
        assert_select 'a[href=?]', repository_path(repository), text: repository.name
      end
    end
  end
end
