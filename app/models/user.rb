require 'net/http'
require 'rexml/document' 

class User
  attr_accessor :username, :artists, :albums, :tracks

  def initialize(username)
    @username = username
    load_user_artists
    load_user_tracks
    load_user_albums
  end

private
  def load_user_artists
    uri = "http://ws.audioscrobbler.com/2.0/?method=library.getartists&api_key=0acd534794ec0c9e320ef8168adc833d&user=" + @username
    data = Net::HTTP.get_response(URI.parse(uri)).body

    @artists = []
    doc = REXML::Document.new(data)
    doc.elements.each('//artist/name') do |artist|
      @artists << Artist.new(artist.text)
    end

    @artists
  end

  def load_user_tracks
    uri = "http://ws.audioscrobbler.com/2.0/?method=library.gettracks&api_key=0acd534794ec0c9e320ef8168adc833d&user=" + @username
    data = Net::HTTP.get_response(URI.parse(uri)).body

    @tracks = []
    doc = REXML::Document.new(data)
    doc.elements.each('//track') do |track|
      @artists << Artist.new(track.elements['artist'].elements['name'].text)
      @tracks << Track.new(track.elements['artist'].elements['name'].text, 
                           track.elements['name'].text)
    end

    @artists.uniq!
    @tracks
  end

  def load_user_albums
    uri = "http://ws.audioscrobbler.com/2.0/?method=library.getalbums&api_key=0acd534794ec0c9e320ef8168adc833d&user=" + @username
    data = Net::HTTP.get_response(URI.parse(uri)).body

    @albums = []
    doc = REXML::Document.new(data)
    doc.elements.each('//album') do |album|
      @artists << Artist.new(album.elements['artist'].elements['name'].text)
      @albums << Album.new(album.elements['artist'].elements['name'].text,
                           album.elements['name'].text)
    end

    @artists.uniq!
    @albums
  end
end
