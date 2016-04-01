class AutoNumber < ActiveRecord::Base
  belongs_to :name
  belongs_to :repository
end
