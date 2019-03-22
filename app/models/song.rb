class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.split(' ').join('-')
  end

  def self.find_by_slug(slug)
    @all_artist_info = []
    self.all.each do |artist|
        if artist.slug == slug
            @all_artist_info << artist
        end
    end 
    @all_artist_info[0]
  end
   
end