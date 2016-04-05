require 'test_helper'

# Repository model tests.
class RepositoryTest < ActiveSupport::TestCase
  test 'must have name' do
    repository = Repository.new
    assert_not repository.valid?
  end

  test 'valid repository can save' do
    repository = Repository.new
    repository.name = 'testrepo'
    assert repository.valid?
    assert repository.save
    repository.reload
    assert_equal repository.name, 'testrepo'
  end
end
