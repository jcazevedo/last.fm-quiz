class QuestionFactory
  def initialize(artists, tracks, albums)
    @artists = artists
    @tracks = tracks
    @albums = albums
  end

  def build_question(type = nil)
    correct_answer = rand(3)
    case type
      when :cover
      length = @albums.length
      selected_album = @albums[rand(length)]
      answers = [nil, nil, nil]
      answers[correct_answer] = selected_album.artist + " - " + 
                                selected_album.title
      
      for i in 0...answers.length
        if answers[i].nil?
          selected = false
          possible_answer = ""

          while !selected

            possible_album = @albums[rand(length)]
            possible_answer = possible_album.artist + " - " +
                              possible_album.title
            selected = true

            for j in 0...answers.length
              next if i == j || answers[j].nil?
              selected = false if possible_answer.eql?(answers[j])
            end

          end

          answers[i] = possible_answer
        end
      end

      return CoverQuestion.new(selected_album.cover_url.to_s,
                               answers,
                               correct_answer)

      when :album
      length = @albums.length
      selected_album = @albums[rand(length)]
      answers = [nil, nil, nil]
      answers[correct_answer] = selected_album.artist
      
      for i in 0...answers.length
        if answers[i].nil?
          selected = false
          possible_answer = ""

          while !selected

            possible_artist = @artists[rand(@artists.length)]
            possible_answer = possible_artist.name
            selected = true

            for j in 0...answers.length
              next if i == j || answers[j].nil?
              selected = false if possible_answer.eql?(answers[j])
            end

          end

          answers[i] = possible_answer
        end
      end

      return AlbumQuestion.new("Who is the author of \'" + 
                               selected_album.title + "\'?", 
                               answers,
                               correct_answer)

      when :track
      length = @tracks.length
      selected_track = @tracks[rand(length)]
      answers = [nil, nil, nil]
      answers[correct_answer] = selected_track.artist
      
      for i in 0...answers.length
        if answers[i].nil?
          selected = false
          possible_answer = ""

          while !selected

            possible_artist = @artists[rand(@artists.length)]
            possible_answer = possible_artist.name
            selected = true

            for j in 0...answers.length
              next if i == j || answers[j].nil?
              selected = false if possible_answer.eql?(answers[j])
            end

          end

          answers[i] = possible_answer         
        end
      end

      return TrackQuestion.new("Who is the author of \'" +
                               selected_track.title + "\'?",
                               answers,
                               correct_answer)

    else
      build_question([:cover, :album, :track][rand(3)])
    end
  end
end
