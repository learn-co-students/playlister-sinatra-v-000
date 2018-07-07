class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  # A Song can belong to ONE Artist and multiple genres
    #
    # def slug #take in name and convert to slug
    #   self.name.gsub(' ', '-').gsub(/[^\w-]/, '').downcase
    # end
    #
    #
    # def self.find_by_slug(value)
    #   self.all.detect{ |a| a.slug == value}
    # end



end
