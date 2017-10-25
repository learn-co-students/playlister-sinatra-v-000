class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    Slugifiable.new.slug(self)
  end

  def self.find_by_slug(text)
    Slugifiable.find_by_slug(text, self)
    #Artist.find_by_name(text.split("-").collect {|text| text.capitalize}.join(" "))
  end
end


