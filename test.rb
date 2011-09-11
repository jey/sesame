require 'rubygems'
require 'httparty'
require 'pp'

class Tumblr
  include HTTParty
  base_uri 'api.tumblr.com'
  default_params :api_key => 'KEY_GOES_HERE'
end

def gastro
  Tumblr.get('/v2/blog/gastrogirl.tumblr.com/posts', :query => { :id => 10050252309, :reblog_info => true })['response']['posts'][0]
end

def fufu
  Tumblr.get('/v2/blog/fufusnomnomz.tumblr.com/posts', :query => { :id => 8104576586, :reblog_info => true, :notes_info => true })['response']['posts'][0]
end

pp fufu

