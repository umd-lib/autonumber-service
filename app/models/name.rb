# Name class.
class Name < ApplicationRecord
  validates :initials, presence: true, allow_blank: false, uniqueness: true
  has_many :auto_numbers, dependent: :restrict_with_exception
  def to_s
    initials
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at id initials updated_at]
  end
end
