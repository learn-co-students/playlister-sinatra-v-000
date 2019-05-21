require_relative './concerns/slugifiable.rb'

class Artist < ActiveRecord::Base
  has_many :songs 
  has_many :genres, through: :songs
  
  def slug
    self.name.gsub(/\s/, '-').gsub(/[^a-zA-Z\d-]/, '').downcase
  end
  
  def self.find_by_slug(slug)
    self.all.find {|obj| obj.slug == slug}
  end
  
  
end