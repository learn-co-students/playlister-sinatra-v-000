class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  def slug
    @slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    self.name = @slug
  end

  def self.find_by_slug(slug)
    words_to_ignore = ["the", "of", "with", "a"]
    new_slug = slug.gsub("-", " ").split(/ |\_/).map do |word|
      unless words_to_ignore.include?(word)
        word.capitalize
      else
        word
    end
  end
    new_slug = new_slug.join(" ")
    self.find_by(name: new_slug)
  end

end
