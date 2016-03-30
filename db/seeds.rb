# Add seed data here. Seed your database with `rake db:seed`

require './config/environment'

@files = []
path = './db/data'
Dir.chdir(path) do
  @files=Dir.glob('*.mp3')
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

def build_objects(artist_name, song_name, genre_name)
    song = Song.create(name: song_name)
    genre = Genre.find_or_create_by(name: genre_name)
    artist = Artist.find_or_create_by(name: artist_name)

    song.song_genres.build(genre: genre)
    song.artist = artist
  
    song.save
end

@files.each do |filename|
      parts = parse_filename(filename)
      build_objects(*parts)
    end




