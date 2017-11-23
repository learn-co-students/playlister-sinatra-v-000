# Add seed data here. Seed your database with `rake db:seed`
require_relative '../config/environment.rb'

song_array = LibraryParser.new.files


i=0
  while i<song_array.count
    x=LibraryParser.new.parse_filename(song_array[i])

    if x[2].include?("-")
      x[2].split("-").each {|y| y.capitalize!}.join(" ")
    else
      x[2]=x[2].capitalize!
    end

    LibraryParser.new.build_objects(x[0],x[1],x[2])
  i+=1
  end

#LibraryParser.new.parse_filename(array[i])
#this gives me the ith element as a three bonger array - artist, song, genre

# next up is build_obects, but I need to include the models in the require_relative
