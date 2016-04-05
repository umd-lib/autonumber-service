class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :initials

      t.timestamps null: false
    end
  end
end
