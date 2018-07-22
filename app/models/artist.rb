require 'pry'
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.gsub(' ', '-').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '-').downcase
  end

  def self.find_by_slug(slug)
    self.all.detect do |genre|
      if genre.slug == slug
        genre
      end
    end
  end
  
end
