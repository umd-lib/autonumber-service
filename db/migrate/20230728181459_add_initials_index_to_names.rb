class AddInitialsIndexToNames < ActiveRecord::Migration[6.1]
  def change
    add_index :names, :initials, unique: true
  end
end
