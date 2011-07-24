class Track
  attr_accessor :artist, :title
  
  def initialize(artist, title)
    @artist = artist
    @title = title
  end

  def eql?(other_track)
    @artist.eql?(other_track.artist) && @title.eql?(other_track.title)
  end

  def hash
    (@artist+@title).hash
  end
end
