class Artist < ActiveRecord::Base
  include Slugifiable
  extend Slugifiable
  has_many :songs
  has_many :genres, through: :songs

  # def slug
  #   self.name.gsub(' ','-').downcase
  # end
  #
  # def self.find_by_slug(slug)
  #   all.detect {|x| x.slug == slug}
  #
  # end
end
