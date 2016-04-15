class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    include Concerns::Slugifiable

    def self.find_by_slug(slug)
      self.find_by(name: slug.split('-').map(&:capitalize).join(" "))
    end
end
