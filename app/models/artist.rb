class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    reverse_slug = slug.gsub("-"," ").split.map{|w| w}.join(" ")
    self.all.each do |artist|
      if !(artist.name.downcase == reverse_slug)
      else
        @artist_name = artist.name
      end
    end
    self.all.find_by(name: @artist_name)
  end

end
