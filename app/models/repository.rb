# Repository class.
class Repository < ApplicationRecord
  validates :name, presence: true, allow_blank: false, uniqueness: true
  has_many :auto_numbers, dependent: :restrict_with_exception
  def to_s
    name
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name updated_at]
  end
end
