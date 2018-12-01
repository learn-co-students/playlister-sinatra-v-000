class Genre < ActiveRecord::Base
  has_many :artists
  has_many :songs

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
   all.find {|item| item.slug == slug}
  end
  
end
