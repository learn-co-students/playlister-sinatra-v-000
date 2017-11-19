class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def self.find_by_slug(slug)
  normalize =  slug.gsub("-"," ").split.select{|x|x.capitalize!}.join(" ")
  Artist.all.find_by({name: normalize})
  end

  def slug
    self.name.gsub(/\W/,"-").downcase
  end

end
