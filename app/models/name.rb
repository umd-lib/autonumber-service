# Name class.
class Name < ActiveRecord::Base
  validates :initials, presence: true, allow_blank: false, uniqueness: true
  has_many :auto_numbers, dependent: :restrict_with_exception
  def to_s
    initials
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "initials", "updated_at"]
  end
end
