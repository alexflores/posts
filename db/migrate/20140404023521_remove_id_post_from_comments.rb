class RemoveIdPostFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :id_post, :integer
  end
end
