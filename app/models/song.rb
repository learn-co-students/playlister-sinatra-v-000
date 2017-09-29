class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.detect {|song| song.slug == slug}
  end
end

# A song instance belongs to one artist instance
# A song instance "has many" genre instances,
# meaning that 1 song instance can belong to MULTIPLE genre instances
# Many-to-many: a song instance has many genre instances, and a genre instance has many song instances
# Enacting this many-to-many relationship requires the use of the song_genres join table

# #slug instance method called on song instance returns "slugified" @name attribute value of song instance:
# any spaces in lowercased version of @name attribute value are replaced with "-"
# call #name getter on implicit song instance to return its @name attribute value
# call #downcase on @name attribute value to ensure that all words in @name string are lowercased
# Call #gsub on lowercased version of @name string to replace any whitespace character " " with a hyphen "-"

# #find_by_slug(slug) is a class method called on the Song class that
# accepts a slugified @name value, such as "blank-space", as the slug argument
# Calling #all on the Song class (referred to as self in class scope) returns the array of all song instances
# Calling #detect on this array of all song instances
# returns the first song instance that makes the block evaluate to true and nil if no song instance is found
# Return the first song instance whose slugified @name attribute value,
# returned by calling #slug instance method on the song instance, equals the slug argument passed to #find_by_slug
