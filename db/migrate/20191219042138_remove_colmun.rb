class RemoveColmun < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :image, :string
    remove_column :posts, :picture, :string

    remove_column :users, :profile, :text
  end
end
