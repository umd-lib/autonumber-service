# Autonumber class.
class AutoNumber < ActiveRecord::Base
  validates :name, presence: true
  validates :repository, presence: true

  belongs_to :name, autosave: true
  belongs_to :repository, autosave: true

  def file_name
    repository.to_s + '-' + id.to_s.rjust(6, '0')
  end

  def self.create_batch(quantity, parameters)
    first = last = nil
    count = 0
    quantity.times do
      auto_number = AutoNumber.new(parameters)
      auto_number.save
      first = auto_number.id if first.nil?
      last = auto_number.id
      count += 1
    end
    { first: first, last: last, count: count }
  end
end
