require 'spec_helper'

describe Blog do
  before(:each) do
    @attr = { :name => "blog_name", :url => "bloggy.tumblr.com" }
  end

  it "should create an instance with valid attributes" do
    Blog.create!(@attr)
  end

  it "should require a name" do
    nameless_blog = Blog.new(@attr.merge(:name => ""))
    nameless_blog.should_not be_valid
  end

  it "should require a url" do
    urlless_blog = Blog.new(@attr.merge(:url => ""))
    urlless_blog.should_not be_valid
  end

  describe "associations" do
    before(:each) do
      @blog = Blog.create(@attr)
    end

    it "should have a posts attribute" do
      @blog.should respond_to :posts
    end
  end
end
