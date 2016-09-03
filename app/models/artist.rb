class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  # --add a hyphen between the your name
  def slug
    self.name.downcase.sub(" ","-")
  end

  # --find by original name before the name became a slug
  def self.find_by_slug(slug)
   name = slug.split("-").map { |word| word.capitalize }.join(" ")
   self.find_by_name(name)
  end

end
