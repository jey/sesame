class Blog < ActiveRecord::Base
  validates_uniqueness_of :name

  def self.from_json(json)
    result = Blog.find_by_name(json['name'])
    result ||= Blog.create!(:name => json['name'], :url => json['url'])
    return result
  end
end

