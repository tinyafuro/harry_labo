class AddPictureToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :picture, :string
  end
end
