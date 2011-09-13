class WidenTumblrIds < ActiveRecord::Migration
  def change
    change_column :posts, :tumblr_id, 'bigint'
  end
end
