class Repository < ActiveRecord::Base
  has_many :auto_numbers
  def to_s
    return name
  end
end
