require 'open-uri'
require 'htree'
require 'rexml/document'
require 'uri'
 
@user_agent = "Mozilla/5.001 (windows; U; NT4.0; en-us) Gecko/25250101"

class User
  attr_accessor :username, :artists, :albums, :tracks

  def initialize(username)
    @username = username
    load_user_artists
    load_user_tracks
    load_user_albums
  end

private
  def load_user_artists(max_artists = 100)
    uri = "http://ws.audioscrobbler.com/2.0/?method=library.getartists&api_key=0acd534794ec0c9e320ef8168adc833d&user=" + URI.encode(@username)

    @artists
  end

  def load_user_tracks
  end

  def load_user_albums
  end
end
