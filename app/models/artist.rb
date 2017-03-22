require 'pry'

class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

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
    Artist.find_by_name(proper_cap_slug)
  end

end
