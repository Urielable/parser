class CreateExpedients < ActiveRecord::Migration[6.0]
  def change
    create_table :expedients do |t|
      t.string :court
      t.string :author
      t.string :defendant
      t.string :summary

      t.timestamps
    end
  end
end
