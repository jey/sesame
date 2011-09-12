require 'rubygems'
require 'httparty'
require 'pp'

class Tumblr
  include HTTParty
  base_uri 'api.tumblr.com'
  default_params :api_key => 'kf8Ox3YsSLmWmO720r8kYFx6Weozf1XCwsbFgac0t2ruRfDI7l'
  
end

def gastro
  post_0 = Tumblr.get('/v2/blog/gastrogirl.tumblr.com/posts', :query => { :reblog_info => true })['response']['posts'][0]
  post_id = post_0["id"]
  
end

def fufu
  post_0 = Tumblr.get('/v2/blog/fufusnomnomz.tumblr.com/posts', :query => { :reblog_info => true, :notes_info => true })['response']['posts'][0]
  post_id = post_0["id"]
end

pp gastro

