# Add seed data here. Seed your database with `rake db:seed`
require_relative '../lib/library_parser'
parse = LibraryParser.new()
files = parse.files

files.each do |file|
  record = parse.parse_filename(file)
  artist = Artist.find_or_create_by(name: record[0])
  song = Song.find_or_create_by(name: record[1])
  song.artist = artist
  genre = Genre.find_or_create_by(name: record[2])
  songgenre = SongGenre.create(:song_id => song.id, :genre_id => genre.id)
end
