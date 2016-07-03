class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    name.split(" ").join("-").downcase
  end

  def self.find_by_slug(arg)
    self.all.find do |a|
      a.slug == arg
      end
    end
end
