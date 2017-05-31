# Name class.
class Name < ActiveRecord::Base
  validates :initials, presence: true, allow_blank: false, uniqueness: true
  has_many :auto_numbers, dependent: :restrict_with_exception
  def to_s
    initials
  end
end
