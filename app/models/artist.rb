class Artist < ActiveRecord::Base
  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    unslugged = slug.split("-")
    self.all.map do |artist|
      if artist.name.downcase.include?(unslugged[0]) && artist.name.downcase.include?(unslugged[1])
        unslugged = artist
      end
    end
    self.find_by_name(unslugged.name)
  end

  has_many :songs
  has_many :genres, through: :songs
end
