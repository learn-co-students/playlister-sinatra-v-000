class Artist < ActiveRecord::Base
  has_many :genres, through: :songs
  has_many :songs

  def slug
    self.name.downcase.gsub(' ','-')
  end

  def self.find_by_slug(name)
    Artist.all.find{|artist| artist.slug == name}
  end

end
