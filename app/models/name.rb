# Name class.
class Name < ActiveRecord::Base
  validates :initials, presence: true
  has_many :auto_numbers
  def to_s
    initials
  end
end
