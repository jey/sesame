require 'rubygems'
require 'httparty'
require 'pp'

class Tumblr
  include HTTParty
  base_uri 'api.tumblr.com'
  default_params :api_key => 'kf8Ox3YsSLmWmO720r8kYFx6Weozf1XCwsbFgac0t2ruRfDI7l'

  def self.get_post(blog, id)
    r = unwrap(self.get("/v2/blog/#{blog}/posts", :query => { :id => id, :reblog_info => true, :notes_info => true, :notes_offset => 50 }))
    return r['posts'][0]
  end

  def self.unwrap(response)
    if response['meta']['status'] == 200
      return response['response']
    else
      raise "Tumblr Error #{response['meta']['status']}: #{response['meta']['msg']}"
    end
  end
end

def get_gastro
  Tumblr.get('/v2/blog/gastrogirl.tumblr.com/posts', :query => { :id => 10050252309, :reblog_info => true })['response']['posts'][0]
end

def get_fufu
  Tumblr.get('/v2/blog/fufusnomnomz.tumblr.com/posts', :query => { :id => 8104576586, :reblog_info => true, :notes_info => true })['response']['posts'][0]
end

def get_nyan
  # http://sagyehan.tumblr.com/post/9966559979
  Tumblr.get_post('sagyehan.tumblr.com', 9966559979)
end

post = get_nyan
pp post
puts
puts post['notes'].length

