class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    Slugifiable.new(name).slug
  end

  def self.find_by_slug(slug)
    name = slug.gsub("-", " ")
    Artist.all.find{|a| a.name.downcase == name}
  end

end
