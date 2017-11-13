# Add seed data here. Seed your database with `rake db:seed`
class Seed < LibraryParser
puts "seed file"
LibraryParser.parse
binding.pry
puts "seed file"
end
