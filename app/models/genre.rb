class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.detect {|genre| genre.slug == slug}
  end
end

# 1 genre instance has many song instances, and 1 song instance has many (i.e. belongs to) multiple genre instances
# This Many-to-Many relationship is enacted via the song_genres join table:
# A genre instance has many song_genre instances of SongGenre class mapped to song_genres join table
# Because a genre instance has many song instances (through the song_genre instances that belong to it, i.e., through the song_genres join table),
# and each song instance belongs to 1 artist instance,
# a genre instance has many artist instances through the song instances that belong to it

# #slug instance method called on genre instance returns "slugified" @name attribute value of genre instance:
# any spaces in lowercased version of @name attribute value are replaced with "-"
# call #name instance getter method on implicit genre instance to return its @name attribute value
# call #downcase on @name attribute value to ensure that all words in @name string are lowercased
# Call #gsub on lowercased version of @name string to replace any whitespace character " " with a hyphen "-"

# #find_by_slug(slug) is a class method called on the Genre class that
# accepts a slugified version of @name value, such as "alternative-rock", as the slug argument
# Calling #all on the Genre class (referred to as self in class scope) returns an array of all genre instances
# Calling #detect on this array of all genre instances
# returns the first genre instance that makes the block evaluate to true and nil if no genre instance is found
# Return the first genre instance whose slugified @name attribute value,
# returned by calling #slug instance method on the genre instance, equals the slug argument passed to #find_by_slug
