class Album
  attr_accessor :artist, :title, :cover_url

  def initialize(artist, title, cover_url)
    @artist = artist
    @title = title
    @cover_url = cover_url
  end

  def eql?(other_album)
    @artist.eql?(other_album.artist) && @title.eql?(other_album.title)
  end

  def hash
    (@artist+@title).hash
  end
end
