# Add seed data here. Seed your database with `rake db:seed`


parser = LibraryParser.new
arrays = parser.files.collect do |file|
  parser.parse_filename(file)
end
arrays.each do |array|
    parser.build_objects(array[0], array[1], array[2])
end


