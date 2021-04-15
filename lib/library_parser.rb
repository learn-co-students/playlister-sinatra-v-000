class LibraryParser

  def self.parser
    path = "./db/migrate/data"
    files = Dir.glob(path + "/*.mp3").collect{|file| file.split(/.+\//).last}
    artist = Artist.all
    genre = Genre.all

    files.each do |f|
      f_ary = f.split(/\s[\-]\s| \[|\].mp3/)
        f_artist = f_ary[0]
        f_song = f_ary[1]
        f_genre = f_ary[2]
      a = Artist.find_or_create_by(name: f_artist)
      g = Genre.find_or_create_by(name: f_genre)
      s = Song.find_or_create_by(name: f_song)
      s.song_genres.build(genre: g)
      s.artist = a
      s.save
    end
  end

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

    song.song_genres.build(genre: genre)
    song.artist = artist

    song.save
  end
end
