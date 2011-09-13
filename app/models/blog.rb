class Blog < ActiveRecord::Base
  validates_presence_of :name
#  validates_presence_of :url
  validates_uniqueness_of :name
  
  has_many :posts

  def self.find_or_create(attrs)
    result = Blog.find_by_name(attrs['name'])
    result ||= Blog.create!(:name => attrs['name'], :url => attrs['url'])
    return result
  end
end

