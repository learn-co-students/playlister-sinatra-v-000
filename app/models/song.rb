class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

    def slug
      song_name = self.name
      slug = song_name.downcase.strip.gsub(' ', '-')
    end

    def self.find_by_slug(slug)
      slug.find_by
      @slug = slug
      results = self.where("name LIKE ?", @short_slug)
      results.detect do |result|
       result.slug === @slug
     end
   end
 end 
