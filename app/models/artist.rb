class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.split(" ").collect {|word| word.downcase}.join("-")
  end

  def self.find_by_slug(slug)
    self.where("lower(name) = ?", slug.split("-").join(" ").downcase).first
    #.split("").drop(1).join("")
  end

end
