# Add seed data here. Seed your database with `rake db:seed`
parser = LibraryParser.new
files = LibraryParser.parse

files.each do |file|
  file_data = parser.parse_filename(file)

  artist_name = file_data[0]
  song_name = file_data[1]
  genre_name = file_data[2]

  parser.build_objects(artist_name, song_name, genre_name)
end
