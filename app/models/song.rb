class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    # Song.all.each {|a| if a.slug == slug; return a; end}
    #SLUG
    all.find {|u| u.slug == slug}
  end

end