# Autonumber class.
class AutoNumber < ApplicationRecord
  validates :name, presence: true
  validates :repository, presence: true

  belongs_to :name, autosave: true
  belongs_to :repository, autosave: true

  def file_name
    "#{repository.to_s}-#{id.to_s.rjust(6, "0")}"
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
    { first:, last:, count:}
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "entry_date", "id", "name_id", "repository_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["name", "repository"]
  end
end
