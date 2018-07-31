class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(sluggedstring)
    #binding.pry

      self.all.find do |inst|
      inst.slug == sluggedstring

        end

  end

end
