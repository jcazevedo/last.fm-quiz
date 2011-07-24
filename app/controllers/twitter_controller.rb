require 'rubygems'
require 'oauth'
require 'twitter'

CTOKEN = 'FsYvtqQ7zFb2dXXIinRLg';
CSECRET = 'N5lxmxZIxCug5FBBYSRsfuQObGLPpRJWNsjJeO5Lo';

def index
    respond_to do |format|
      format.html # index.html.erb
    end
end

def tweetScore
    oauth = OAuth::Consumer.new(CTOKEN, CSECRET, :site => 'http://api.twitter.com', :request_endpoint => 'http://api.twitter.com', :sign_in => true)
    request = oauth.get_request_token
    access = requestT.get_access_token

    Twitter.configure do |config|
      config.consumer_key = CTOKEN
      config.consumer_secret = CSECRET
      config.oauth_token = access.token
      config.oauth_token_secret = access.secret
    end

    Twitter.update("Just got a new high score on #lastfmquiz #geekslab")
end
