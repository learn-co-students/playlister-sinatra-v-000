class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    new_name = self.name.downcase.split(" ")
    new_name.join("-")
  end

  def self.find_by_slug(name)
    unslug_name = name.split("-")
    unslugged = unslug_name.join(" ").titleize
    Artist.find_by(:name => unslugged)
  end

end
