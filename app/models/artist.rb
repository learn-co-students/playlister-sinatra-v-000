require_relative "./concerns/slugifiable"

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  # def slug
  #   self.name.downcase.gsub(" ", "-")
  # end
  #
  # def self.find_by_slug(slug)
  #   Artist.all.find do |artist|
  #     artist.slug == slug
  #   end
  # end
end
