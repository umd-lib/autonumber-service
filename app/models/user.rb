# CAS User
class User < ApplicationRecord
  validates :cas_directory_id, :name, presence: true, allow_blank: false
end
