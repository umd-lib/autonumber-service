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

  test 'repository without auto_numbers can be deleted' do
    repository = Repository.create(name: 'test')
    assert_nothing_raised do
      repository.destroy
    end
  end

  test 'repository with auto_numbers cannot be deleted' do
    name = Name.create(initials: 'pme')
    repository = Repository.create(name: 'test')
    AutoNumber.create(name: name, repository: repository)
    assert_raise ActiveRecord::DeleteRestrictionError do
      repository.destroy
    end
  end
end
