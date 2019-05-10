class CreateReserves < ActiveRecord::Migration[5.1]
  def change
    create_table :reserves do |t|
      t.date :rdate
      t.integer :car_id
      t.integer :user_id

      t.timestamps
    end
    add_index :reserves, :car_id
    add_index :reserves, :user_id
    add_index :reserves, [:car_id, :user_id], unique: true
  end
end
