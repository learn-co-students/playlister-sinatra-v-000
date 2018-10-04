

class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  #has_many :genres, through: :song_genres


    def slug
      #slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
      name.parameterize
    end

    def self.find_by_slug(slug)
      self.all.detect do |a|
        a.slug == slug
      end
    end

end
