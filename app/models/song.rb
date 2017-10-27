class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.gsub(/\s/, '-')
  end

  def self.find_by_slug(slug)
    query = nil
    self.all.each do |a|
      if a.slug == slug
        query = a
      end
    end
    if !!query
      query
    else
      nil
    end
  end
end
