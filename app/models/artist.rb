class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    reverse_slug = slug.gsub("-"," ").split.map{|w| w.capitalize}.join(" ")
    self.all.find_by(name: reverse_slug)
  end

end
