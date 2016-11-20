class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :title, null: false
      t.text :description
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
    add_index :works, [:user_id, :created_at]
  end
end
