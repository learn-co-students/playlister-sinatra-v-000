class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs 

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug_name)
    self.all.find do |name|
      name.slug == slug_name
    end
  end

end ## class end