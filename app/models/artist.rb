class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)

    name = slug.gsub("-", " ").split.map{|v|
      if v == "with" || v == "a"
        v
      else
        v.capitalize
      end}.join(" ")

    Artist.find_by(name: name)
  end
end
