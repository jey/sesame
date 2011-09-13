require 'spec_helper'

describe Post do
  before(:each) do
    @attr = {
      :reblogged_root_url => "http://blog.tumblr.com/post/id/post-name",
      :reblogged_from_name => "middle_blog",
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
  
  it "should require a tumblr_id" do
    idless_post = Post.new(@attr.merge(:tumblr_id => ""))
    idless_post.should_not be_valid
  end
  
  it "should require a reblogged_root_name" do
    rootnameless_post = Post.new(@attr.merge(:reblogged_root_name => ""))
    rootnameless_post.should_not be_valid
  end
  
  it "should require a timestamp" do
    timeless_post = Post.new(@attr.merge(:timestamp => ""))
    timeless_post.should_not be_valid
  end
  
  describe "blog association" do
    before(:each) do
      @blog = Blog.create({ :name => "blog_name", :url => "bloggy.tumblr.com" })
      @post = Post.create(@attr)
    end
    
    it "should belong to a blog" do
      @post.should respond_to(:blog)
    end
  end
end
