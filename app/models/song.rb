class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres


  @@slug_name = Hash.new

  def slug
    @slug = self.name.downcase.gsub(" ", "-")
    self.save
    @slug
  end

  def self.find_by_slug(slug)
    #binding.pry

    self.all.find(slug) {|name| name.slug == slug}
  end

end
