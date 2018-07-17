class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  def slug
    @slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    @slug
  end

  def self.find_by_slug(slug)
    binding.pry
    new_slug = slug.gsub("-", " ")
    Artist.find(name: new_slug)
  end


end
