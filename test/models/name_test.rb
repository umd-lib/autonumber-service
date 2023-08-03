require 'test_helper'

# Name model tests.
class NameTest < ActiveSupport::TestCase
  test 'must have initials' do
    name = Name.new
    assert_not name.valid?
  end

  test 'valid name can save' do
    name = Name.new
    name.initials = 'pme'
    assert name.valid?
    assert name.save
    name.reload
    assert_equal name.initials, 'pme'
  end

  test 'name without auto_numbers can be deleted' do
    name = Name.create(initials: 'pme')
    assert_nothing_raised do
      name.destroy
    end
  end

  test 'name with auto_numbers cannot be deleted' do
    name = Name.create(initials: 'pme')
    repository = Repository.create(name: 'test')
    AutoNumber.create(name:, repository:)
    assert_raise ActiveRecord::DeleteRestrictionError do
      name.destroy
    end
  end
end
