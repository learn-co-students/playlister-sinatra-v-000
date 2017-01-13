class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.strip.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
    self.all.each do |s|
      if s.slug == slug
        return s
      end
    end
  end
  
end
