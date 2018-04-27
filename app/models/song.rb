class Song < ActiveRecord::Base
  # validates :name, presence: true
  # validates :artist_id

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    # binding.pry
      self.name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
      self.all.detect do|song|
        song.slug == slug
      end
    end
end
