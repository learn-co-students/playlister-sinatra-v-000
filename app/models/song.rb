class Song < ActiveRecord::Base

  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug
    self.name.downcase.strip.gsub(' ','-')
  end

  def self.find_by_slug(slug)
    small_words = %w[at a an and but by	down for from in into like near of off on or out over plus the to up upon with]
    capitalized_slug = slug.split('-').map do |word|
      small_words.include?(word) ? word : word.capitalize
    end
    capitalized_slug.first.capitalize!
    capitalized_slug.last.capitalize!
    proper_cap_slug = capitalized_slug.join(' ')
    Song.find_by_name(proper_cap_slug)
  end

end
