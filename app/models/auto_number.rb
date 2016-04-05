# Auto Number class.
class AutoNumber < ActiveRecord::Base
  validates :name, presence: true
  validates :repository, presence: true

  belongs_to :name
  belongs_to :repository

  def file_name
    repository.to_s + '-' + id.to_s
  end
end
