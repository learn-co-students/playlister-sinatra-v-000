class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  @@slug_name = Hash.new

  def slug
    slugafied = self.name.downcase.gsub(" ", "-")
    @@slug_name[slugafied.to_sym] = self.name
    slugafied
  end

  def self.find_by_slug(slug)
    deslugafied = @@slug_name[slug.to_sym]
    #deslugafied = slug.gsub("-", " ").downcase.split(" ").map {|n| n.capitalize}.join(" ")
    self.find_by(name: deslugafied)
  end

end
