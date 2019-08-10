class LibraryParser
  def files
    data_path = File.join(File.dirname(__FILE__), '..', 'db', 'data')
    Dir.entries(data_path)[2..-1]
  end

  def self.parse
    self.new.call
  end

  def parse_filename(filename)
    artist_match = filename.match(/^(.*) -/)
    song_match   = filename.match(/- (.*) \[/)
    genre_match  = filename.match(/\[([^\]]*)\]/)

    artist = artist_match && artist_match[1]
    song   = song_match   && song_match[1]
    genre  = genre_match  && genre_match[1]

    [artist, song, genre]
  end

  def call
    files.each do |filename|
      parts = parse_filename(filename)
      build_objects(*parts)
    end
  end

  def build_objects(artist_name, song_name, genre_name)
    song = Song.create(name: song_name)
    genre = Genre.find_or_create_by(name: genre_name)
    artist = Artist.find_or_create_by(name: artist_name)
    
    artist.songs << song
    genre.songs << song
    
    # Caveat: artist.genres can contain more than one of the SAME instance of Genre, and vice-versa.
    # So, I would need to use artist.genres.uniq when displaying an artist's genres (and vice-versa).
    # However, the code above was the answer to a nasty rabbit hole question about those AR associations.
  end

    #song.song_genres.build(genre: genre)
    #song.artist = artist
    #
    #song.save
  #end
end