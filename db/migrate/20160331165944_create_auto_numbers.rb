class CreateAutoNumbers < ActiveRecord::Migration[4.2]
  def change
    create_table :auto_numbers do |t|
      t.date :entry_date
      t.references :name, index: true, foreign_key: true
      t.references :repository, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
