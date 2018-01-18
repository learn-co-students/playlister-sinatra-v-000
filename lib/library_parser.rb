class LibraryParser
  def files
    data_path = File.join(File.dirname(__FILE__), '..', 'db', 'data')
    Dir.entries(data_path)[2..-1]
  end

  def self.parse
    self.new.call
  end

=begin
///////Here's how the "parse_filename" regex's defined below work////////
file1 =  "First Song - Artist1[genre1].mp3"

x = file1.match(/^(.*) -/)
# This returns => #<MatchData "First Song -" 1:"First Song">

y = file1.match(/^(.*) -/)[1]
# This returns => "First Song"

z = file1.scan(/^(.*) -/)[0][0]
# This returns => "First Song"
/////////////////////////////////////////////////////////////////////////
=end
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
