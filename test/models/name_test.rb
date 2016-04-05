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
end
