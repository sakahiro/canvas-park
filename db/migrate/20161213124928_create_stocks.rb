class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.references :user, foreign_key: true, null: false
      t.references :work, foreign_key: true, null: false

      t.timestamps
    end
  end
end
