class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  include Slugifiable

  def self.find_by_slug(slug)
    stop_words = %w{a an and the or for of nor with}
    name = slug.split("-").each_with_index.map { |word, index| stop_words.include?(word) && index > 0 ? word : word.capitalize }.join(" ")
    self.find_by_name(name)
  end

end
