class Post < ActiveRecord::Base
  validates_presence_of :tumblr_id
  #validates_presence_of :reblogged_root_post_id
  validates_presence_of :blog
  
  belongs_to :blog
  
  def complete?
    raise "fixme"
    return false
  end
end

