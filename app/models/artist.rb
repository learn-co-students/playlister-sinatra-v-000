class Artist < ActiveRecord::Base
  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods
  
  has_many :songs
  has_many :genres, through: :songs
  
  def slug
    name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
    
  def self.find_by_slug(slug)
    Artist.all.detect{|v| v.slug == slug}
  end
  
end