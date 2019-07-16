class Artist < ActiveRecord::Base

  validates_presence_of :name

  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(" ", "-")
  end

 def self.find_by_slug(slug)
   Artist.all.find do |artist|
     artist.slug == slug
   end
 end

end
