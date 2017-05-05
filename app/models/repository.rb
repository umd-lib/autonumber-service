# Repository class.
class Repository < ActiveRecord::Base
  validates :name, presence: true, allow_blank: false, uniqueness: true
  has_many :auto_numbers, dependent: :restrict_with_exception
  def to_s
    name
  end
end
