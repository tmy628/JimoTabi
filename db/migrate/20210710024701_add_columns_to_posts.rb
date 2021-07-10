class AddColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :prefecture_code, :integer
  end
end
