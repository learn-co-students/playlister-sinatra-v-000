class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  def slug
    @slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    self.name = @slug
  end

  def self.find_by_slug(slug)
    new_slug = slug.gsub("-", " ").split(/ |\_/).map(&:capitalize).join(" ")
    Artist.find_by(name: new_slug)
  end


end
