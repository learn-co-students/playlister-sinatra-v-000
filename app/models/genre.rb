require 'pry'
class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    self.all.each do |instance|
      if instance.slug == slug
        return instance
      end
    end
  end

end
