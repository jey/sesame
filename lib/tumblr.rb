require 'rubygems'
require 'httparty'
require 'pp'

class Tumblr
  include HTTParty
  base_uri 'api.tumblr.com'
  default_params :api_key => 'kf8Ox3YsSLmWmO720r8kYFx6Weozf1XCwsbFgac0t2ruRfDI7l'

  def self.get_post(blog_domain, id)
    r = unwrap(self.get("/v2/blog/#{blog_domain}/posts", :query => { :id => id, :reblog_info => true, :notes_info => true }))
    return r['posts'][0]
  end

  def self.get_blog_and_posts(blog_domain, opts = {})
    offset = opts[:offset] || 0
    r = unwrap(self.get(
            "/v2/blog/#{blog_domain}/posts",
            :query => {
                :reblog_info => true,
                :notes_info => true,
                :offset => offset }))
    return r
  end

  def self.get_blog(blog_domain)
    r = get_blog_and_posts(blog_domain)
    return r['blog']
  end

  def self.get_posts(blog_domain, opts)
    r = get_blog_and_posts(blog_domain, opts)
    return r['posts']
  end

  def self.unwrap(response)
    if response['meta']['status'] == 200
      return response['response']
    else
      raise "Tumblr Error #{response['meta']['status']}: #{response['meta']['msg']}"
    end
  end
end

