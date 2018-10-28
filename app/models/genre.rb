class Genre < ActiveRecord::Base

  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug( slug)
    self.all.find{|data| data.slug == slug}
    #name.split.join(' ').gsub('-',' ').split.map(&:capitalize).join(' ')
  end

end
