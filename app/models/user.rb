require 'net/http'
require 'rexml/document' 

class User
  attr_accessor :username, :artists, :albums, :tracks

  def initialize(username)
    @username = username
    @artists = []
    @tracks = []
    @albums = []
    load_user_artists
    load_user_tracks
    load_user_albums
  end

  def generate_questions
    questions = []
    factory = QuestionFactory.new(@artists, @tracks, @albums)

    for i in 1..10
      questions << factory.build_question
    end

    questions
  end

private
  def load_user_artists(page = 1)
    uri = "http://ws.audioscrobbler.com/2.0/?method=library.getartists&api_key=0acd534794ec0c9e320ef8168adc833d&user=" + @username + "&page=" + page.to_s
    data = Net::HTTP.get_response(URI.parse(uri)).body

    doc = REXML::Document.new(data)
    doc.elements.each('//artist/name') do |artist|
      @artists << Artist.new(artist.text)
    end

    if page == 1
      load_user_artists(rand(doc.elements['//artists'].attributes['totalPages'].to_i - 1) + 2)
    end

    @artists
  end

  def load_user_tracks(page = 1)
    uri = "http://ws.audioscrobbler.com/2.0/?method=library.gettracks&api_key=0acd534794ec0c9e320ef8168adc833d&user=" + @username + "&page=" + page.to_s
    data = Net::HTTP.get_response(URI.parse(uri)).body

    doc = REXML::Document.new(data)
    doc.elements.each('//track') do |track|
      @artists << Artist.new(track.elements['artist'].elements['name'].text)
      @tracks << Track.new(track.elements['artist'].elements['name'].text, 
                           track.elements['name'].text)
    end

    if page == 1
      load_user_tracks(rand(doc.elements['//tracks'].attributes['totalPages'].to_i - 1) + 2)
    end

    @artists.uniq!
    @tracks
  end

  def load_user_albums(page = 1)
    uri = "http://ws.audioscrobbler.com/2.0/?method=library.getalbums&api_key=0acd534794ec0c9e320ef8168adc833d&user=" + @username + "&page=" + page.to_s
    data = Net::HTTP.get_response(URI.parse(uri)).body

    doc = REXML::Document.new(data)
    doc.elements.each('//album') do |album|
      @artists << Artist.new(album.elements['artist'].elements['name'].text)
      @albums << Album.new(album.elements['artist'].elements['name'].text,
                           album.elements['name'].text,
                           album.elements['image[@size="large"]'].text)
    end

    if page == 1
      load_user_albums(rand(doc.elements['//albums'].attributes['totalPages'].to_i - 1) + 2)
    end

    @artists.uniq!
    @albums
  end
end
