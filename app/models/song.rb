class Song < ActiveRecord::Base
  include Slugifiable
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def self.find_by_slug(slug)
    Song.all.find {|song| song.slug == slug}
  #   unslugged = slug.split("-")
  #   self.all.map do |song|
  #     if song.name.downcase.include?(unslugged[0]) && song.name.downcase.include?(unslugged[1])
  #       unlugged_song = song
  #     end
  #   end
  #   #binding.pry
  #   self.find_by_name(unslugged_song.name)
  # end
  end
end
