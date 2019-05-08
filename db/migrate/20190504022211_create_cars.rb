class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :title
      t.text :body
      t.string :field
      t.string :carmodel
      t.string :carsize
      t.string :other
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :cars, [:user_id, :created_at]
  end
end
