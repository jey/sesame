class Post < ActiveRecord::Base
  validates_presence_of :tumblr_id
end

