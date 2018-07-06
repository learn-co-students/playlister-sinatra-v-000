class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

    # def slug #take in name and convert to slug
    #   name = self.name
    #   splt_name = name.gsub(" ", "-").gsub(/[^\w-]/, '').downcase
    # end
    #
    #
    # def self.find_by_slug(value)
    #   self.all.detect{ |a| a.slug == value}
    #
    # end




end
