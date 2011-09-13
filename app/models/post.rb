class Post < ActiveRecord::Base
  validates_presence_of :reblogged_root_name
  validates_presence_of :tumblr_id
  validates_presence_of :timestamp
  
  belongs_to :blog
end

