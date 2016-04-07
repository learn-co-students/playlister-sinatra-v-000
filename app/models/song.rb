class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  include Slugify
  extend FindBySlug

  def add_genres(params)
    params[:genres].each do |genre|
      g = Genre.find_by_id(genre.to_i)
      self.genres << g
    end
  end

end