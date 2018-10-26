class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def Artist.find_by_slug(name)
    name = 
    name.split.join(' ').gsub('-',' ').split.map(&:capitalize).join(' ')
  end

end
