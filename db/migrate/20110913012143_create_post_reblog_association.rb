class CreatePostReblogAssociation < ActiveRecord::Migration
  def change
    remove_column :posts, :reblogged_root_name
    remove_column :posts, :reblogged_root_url
    remove_column :posts, :reblogged_from_name
    add_column :posts, :reblogged_root_post_id, :integer, :null => false
    add_column :posts, :reblogged_from_post_id, :integer
  end
end
