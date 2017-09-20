class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(item)
    Artist.all.find{|a| a.slug == item}
  end


end
