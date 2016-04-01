class Name < ActiveRecord::Base
  has_many :auto_numbers
  def to_s
    return initials
  end
end
