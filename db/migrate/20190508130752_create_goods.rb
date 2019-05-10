class CreateGoods < ActiveRecord::Migration[5.1]
  def change
    create_table :goods do |t|
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
    add_index :goods, :article_id
    add_index :goods, :user_id
    add_index :goods, [:article_id, :user_id], unique: true
  end
end
