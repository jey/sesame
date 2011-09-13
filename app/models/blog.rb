class Blog < ActiveRecord::Base
# An id of 0 refers to an unspecified private blog.

  validates_presence_of :name
#  validates_presence_of :url
  validates_uniqueness_of :name
  
  has_many :posts

  def name=(val)
    self[:name] = self.class.canonical_name(val)
  end

  def self.canonical_name(name)
    if name
      name = name.sub(/.tumblr.com$/, '')
      name = name.sub(%r{-deactivated\d+-?$}, '')
    end
    return name
  end

  def self.find_or_create(attrs)
    attrs['name'] = canonical_name(attrs['name'])
    result = Blog.find_by_name(attrs['name'])
    result ||= Blog.create!(:name => attrs['name'], :url => attrs['url'])
    return result
  end
end

