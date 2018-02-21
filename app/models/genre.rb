class Genre < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  # DOWNCASE_WORDS = ["a", "for", "is", "the", "with"]
  #
  # def find_by_slug(slug)
  #   name = slug.split("-")
  #   name = name.map do |word|
  #     DOWNCASE_WORDS.include?(word) && !(name[0] == word) ? word : word.capitalize!
  #   end.join(" ")
  #   self.all.find_by_name(name)
  # end
  #
  # def slug
  #   self.name.split(" ").map do |word|
  #     word.downcase
  #   end.join("-")
  # end
end
