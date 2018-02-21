class Song < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

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
