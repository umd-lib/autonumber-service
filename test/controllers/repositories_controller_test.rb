require 'test_helper'

class RepositoriesControllerTest < ActionController::TestCase
  setup do
    @repository = repositories(:one)
    @repository.name += 'foo'
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:repositories)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create repository' do
    assert_difference('Repository.count') do
      post :create, params: { repository: { name: @repository.name } }
    end

    assert_redirected_to repository_path(assigns(:repository))
  end

  test 'should show repository' do
    get :show, params: { id: @repository }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @repository }
    assert_response :success
  end

  test 'should update repository' do
    patch :update, params: { id: @repository, repository: { name: @repository.name } }
    assert_redirected_to repository_path(assigns(:repository))
  end

  test 'should not destroy repository with auto_numbers' do
    assert_difference('Repository.count', 0) do
      delete :destroy, params: { id: @repository }
    end

    assert_redirected_to repositories_path
  end

  test 'should destroy repository without auto_numbers' do
    new_repository = Repository.create(name: 'foobar')
    assert_difference('Repository.count', -1) do
      delete :destroy, params: { id: new_repository }
    end

    assert_redirected_to repositories_path
  end
end
