# Add seed data here. Seed your database with `rake db:seed`
Song.delete_all
Genre.delete_all
Artist.delete_all
LibraryParser.new.call
binding.pry
