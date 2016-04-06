# Auto Number class.
class AutoNumber < ActiveRecord::Base
  belongs_to :name
  belongs_to :repository

  def file_name
    repository.to_s + '-' + id.to_s
  end
end
