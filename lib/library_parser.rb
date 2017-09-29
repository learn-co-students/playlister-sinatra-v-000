class LibraryParser
  def files
    data_path = File.join(File.dirname(__FILE__), '..', 'db', 'data')
    Dir.entries(data_path)[2..-1]
  end

  def self.parse
    self.new.call
  end

  def parse_filename(filename) # example of filename argument: "Adele - Rolling In the Deep [folk].mp3"
    artist_match = filename.match(/^(.*) -/) # artist_match example: #<MatchData "Adele -" 1:"Adele">
    song_match   = filename.match(/- (.*) \[/) # song_match example: #<MatchData "- Rolling In the Deep [" 1:"Rolling In the Deep">
    genre_match  = filename.match(/\[([^\]]*)\]/) # genre_match example: #<MatchData "[folk]" 1:"folk">

    artist = artist_match && artist_match[1] # artist example: "Adele"
    song   = song_match   && song_match[1] # song example: "Rolling In the Deep"
    genre  = genre_match  && genre_match[1] # genre example: "folk"

    [artist, song, genre] # example array: ["Adele", "Rolling In the Deep", "folk"]
  end

  def call
    files.each do |filename|
      parts = parse_filename(filename) # parts is an array [artist, song, genre] such as ["Adele", "Rolling In the Deep", "folk"]
      build_objects(*parts) # splat operator (*) indicates that we'll send the string elements of the parts array as arguments to #build_objects method call
    end
  end

  def build_objects(artist_name, song_name, genre_name)
    song = Song.create(name: song_name) # example: creating song instance with @name = "Rolling In the Deep" and saving it to DB
    genre = Genre.find_or_create_by(name: genre_name) # example: finding/creating genre instance with @name = "folk" and saving it to DB
    artist = Artist.find_or_create_by(name: artist_name) # example: finding/creating artist instance with @name = "Adele" and saving it to DB

    song.song_genres.build(genre: genre) # calling #song_genres on song instance returns array of genre instances that the song instance has many of. Then calling #build on this array instantiates a genre instance already belonging to song instance's collection of genre instances
    song.artist = artist # calling #artist= AR method on song instance, setting its @artist attribute = artist instance to which song instance belongs to tell the song instance that it belongs to 1 artist instance

    song.save # update the song instance's row representation in songs table now that we told it the artist instance that it belongs to and the genres it has many of
  end
end
