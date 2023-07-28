class AddNameIndexToRepositories < ActiveRecord::Migration[6.1]
  def change
    add_index :repositories, :name, unique: true
  end
end
