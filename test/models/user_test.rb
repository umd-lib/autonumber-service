require 'test_helper'

# Unit tests for User class
class UserTest < ActiveSupport::TestCase
  test 'must have name and directory id' do
    user = User.new
    assert_not user.valid?
  end

  test 'must have name' do
    user = User.new cas_directory_id: 'rollotomasi'
    assert_not user.valid?
  end

  test 'must have directory id' do
    user = User.new name: 'Rollo Tomasi'
    assert_not user.valid?
  end

  test 'valid user' do
    user = User.new cas_directory_id: 'rollotomasi', name: 'Rollo Tomasi'
    assert user.valid?
  end
end
