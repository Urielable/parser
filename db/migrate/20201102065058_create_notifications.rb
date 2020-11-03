class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :date
      t.string :description
      t.references :expedient, null: true, foreign_key: true

      t.timestamps
    end
  end
end
