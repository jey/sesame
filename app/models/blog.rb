class Blog < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :url
  validates_uniqueness_of :name
  
  has_many :posts

  def self.from_json(json)
    result = Blog.find_by_name(json['name'])
    result ||= Blog.create!(:name => json['name'], :url => json['url'])
    return result
  end
end

