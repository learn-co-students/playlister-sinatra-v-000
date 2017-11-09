class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  # def self.find_by_slug(slug)
  #   self.find_by(name: slug.sub("-", " ").gsub(/[A-Za-z']+/,&:capitalize))
  # end

  #better
  def self.find_by_slug(slug)
    self.all.find{|object| object.slug == slug}
    
  end

end
