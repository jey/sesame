class Post < ActiveRecord::Base
# A root_post_id of 0 means the post is it's own root.

  validates_presence_of :reblogged_root_post_id
  validates_presence_of :blog
  
  belongs_to :blog
  
  def complete?
    raise "fixme"
    return false
  end
end

