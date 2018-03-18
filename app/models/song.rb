class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug) #use find
    self.all.find do |song|
      if song.slug == slug
        @song = song
        end
      end
      @song
    end
end
