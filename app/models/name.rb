# Name class.
class Name < ActiveRecord::Base
  has_many :auto_numbers
  def to_s
    initials
  end
end
