class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
    #
    # def slug #take in name and convert to slug
    #   self.name.gsub(" ", "-").gsub(/[^\w-]/, '').downcase
    # end
    #
    #
    # def self.find_by_slug(value)
    #
    #   self.all.detect{ |a| a.slug == value}
    #
    # end

end
