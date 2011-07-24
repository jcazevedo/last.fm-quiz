class Artist
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def eql?(other_artist)
    @name.eql?(other_artist.name)
  end

  def hash
    @name.hash
  end
end
