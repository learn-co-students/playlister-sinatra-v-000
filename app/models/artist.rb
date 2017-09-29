class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.detect{|artist| artist.slug == slug}
  end
end
  # an artist instance has many song instances, and
  # each song instance can belong to multiple genre instances, so
  # an artist instance has many genre instances through the song instances that belong to it

  # #slug instance method called on artist instance returns "slugified" @name attribute value of artist instance:
  # any spaces in lowercased version of @name attribute value are replaced with "-"
  # call #name getter on implicit artist instance to return its @name attribute value
  # call #downcase on @name attribute value to ensure that all words in @name string are lowercased
  # Call #gsub on lowercased version of @name string to replace any whitespace character " " with a hyphen "-"

  # #find_by_slug(slug) is a class method called on the Artist class that
  # accepts a slugified @name value, such as "taylor-swift", as the slug argument
  # Calling #all on the Artist class (self) returns the array of all artist instances
  # Calling #detect on this array of all artist instances
  # returns the first artist instance that makes the block evaluate to true and nil if no artist instance is found
  # Return the first artist instance whose slugified @name attribute value,
  # returned by calling #slug instance method on the artist instance, equals the slug argument passed to #find_by_slug
