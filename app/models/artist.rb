class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    new_name = name.downcase
    new_name.gsub(' ', '-')
  end

  def self.find_by_slug(name_slug)
    Artist.all.find{|a| a.slug == name_slug}
  end

end
