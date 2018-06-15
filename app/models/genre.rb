class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.parameterize
  end

  def self.find_by_slug(slug)
  #  converted_slug = slug.split("-").join(" ")
    self.all.find{|genre| genre.name.parameterize == slug}
  end
end

#hip-hop > hip-hop > hip hop
#west coast pop> west-coast-pop > west coast pop
