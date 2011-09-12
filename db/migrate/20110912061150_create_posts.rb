class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :reblogged_root_url
      t.string :reblogged_from_name
      t.string :reblogged_root_name
      t.string :type
      t.integer :note_count
      t.string :timestamp
      t.integer :id

      t.timestamps
    end
  end
end
