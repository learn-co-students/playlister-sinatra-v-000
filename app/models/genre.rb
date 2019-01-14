require_relative "./concerns/slugifiable"

class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  # def slug
  #   self.name.downcase.gsub(" ", "-")
  # end
  #
  # def self.find_by_slug(slug)
  #   Genre.all.find do |genre|
  #     genre.slug == slug
  #   end
  # end
end
