class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :name, :unique => true
      t.string :url
      t.timestamps
    end

    add_index :blogs, :name, :unique => true
  end
end
