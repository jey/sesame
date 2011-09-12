require 'spec_helper'

describe Post do
  before(:each) do
    @attr = {
      :reblogged_root_url => "http://blog.tumblr.com/post/id/post-name",
      :reblogged_from_name => "middle_man",
      :reblogged_root_name => "source_blog",
      :type => "photo",
      :note_count => 22,
      :timestamp => 1311716336,
      :tumblr_id => 12345
    }
  end
  
  it "should create an instance with valid attributes" do
    Post.create!(@attr)
  end
  
end
