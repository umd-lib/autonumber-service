class CreateNames < ActiveRecord::Migration[4.2]
  def change
    create_table :names do |t|
      t.string :initials

      t.timestamps null: false
    end
  end
end
