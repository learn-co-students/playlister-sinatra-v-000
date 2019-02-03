class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  
  def slug
    return self.name.gsub(/[^a-zA-Z0-9]+/,'-').downcase
  end
  
  def self.find_by_slug(slug)
    selected = self.all.select do |artist|
      artist.slug == slug
    end
    if selected.empty?
      "No found"
    else
      selected.first
    end
  end
  
end