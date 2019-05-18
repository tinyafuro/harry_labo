class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :car_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
