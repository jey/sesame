class AllowNullPostTumblrId < ActiveRecord::Migration
  def up
    change_column :posts, :tumblr_id, "bigint", :null => true
  end

  def down
    change_column :posts, :tumblr_id, "bigint", :null => false
  end
end
