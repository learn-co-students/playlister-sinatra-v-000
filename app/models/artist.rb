class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.split(' ').join('-')
  end

  def self.find_by_slug(slug)
    nocaps = ['the','with','and', 'a']
    artist_name = slug.split('-').map{|word| nocaps.include?(word) ? word : word.capitalize}.join(' ')
    self.find_by_name(artist_name)
  end

end
