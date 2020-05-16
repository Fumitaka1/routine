class ChangeContentsOfPosts < ActiveRecord::Migration[5.2]
  def up
    change_column :posts, :contents, :text, null: false
    change_column_null :posts, :title, false
  end
end
