class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    arr = self.name.split(' ')
    arr.map do |x|
      x.gsub!(/[^0-9A-Za-z]/, '')
    end
    slug = arr.join('-')
    slug.downcase
  end

  def self.find_by_slug(slug)
    arr = slug.split('-')
    slug = arr.join(' ')
    self.where(["lower(name) = ?", slug]).first
  end
end
