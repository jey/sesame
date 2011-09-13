require 'spec_helper'

describe Post do
  before(:each) do
    @attr = {
      :reblogged_root_post_id => 0,
      :type => "photo",
      :note_count => 22,
      :timestamp => 1311716336,
      :tumblr_id => 12345,
      :url => "http://bloggy.tumblr.com/id/name"
    }
  end
  
  it "should create an instance with valid attributes"
  
  it "should require a tumblr_id" do
    idless_post = Post.new(@attr.merge(:tumblr_id => ""))
    idless_post.should_not be_valid
  end

  it "should require a url" do
    urlless_post = Post.new(@attr.merge(:url => ""))
    urlless_post.should_not be_valid
  end
  
  it "should require a timestamp" do
    timeless_post = Post.new(@attr.merge(:timestamp => ""))
    timeless_post.should_not be_valid
  end
  
  describe "blog association" do
    before(:each) do
      @blog = Blog.create({ :name => "blog_name", :url => "bloggy.tumblr.com" })
      @post = @blog.posts.create(@attr)
    end
    
    it "should belong to a valid blog"
  end
  
  describe "post association" do
    before(:each) do
      @blog = Blog.create({ :name => "blog_name", :url => "bloggy.tumblr.com" })
    end
    
    it "should require a reblogged_root_post_id"
  end
end
