# CAS User
class User < ActiveRecord::Base
  validates :cas_directory_id, :name, presence: true, allow_blank: false
end
