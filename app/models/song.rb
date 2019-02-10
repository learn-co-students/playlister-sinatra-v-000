
class Song < ActiveRecord::Base
  #include Slug
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.strip.gsub(" ", "-")
    #binding.pry
  end

  def self.find_by_slug(slug)
    Song.all.find{|genre| genre.slug == slug}
    # self.all.each do |song|
      # if song.slug == search_slug
        # return song
       #end
    # end
  end

end
