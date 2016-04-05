require 'test_helper'

# Auto Number model tests.
class AutoNumberTest < ActiveSupport::TestCase
  def setup
    @name = names(:one)
    @repository = repositories(:one)
    @date = Date.new
  end

  test 'must have name' do
    auto_number = AutoNumber.new(
      repository: @repository,
      entry_date: @date
    )
    assert_not auto_number.valid?
  end

  test 'must have repository' do
    auto_number = AutoNumber.new(
      name: @name,
      entry_date: @date
    )
    assert_not auto_number.valid?
  end

  test 'valid auto_number can save' do
    auto_number = AutoNumber.new(
      name: @name,
      repository: @repository,
      entry_date: @date
    )
    assert auto_number.valid?
    assert auto_number.save
    auto_number.reload
    assert_equal auto_number.name, @name
    assert_equal auto_number.repository, @repository
    assert_equal auto_number.entry_date, @date
  end
end
