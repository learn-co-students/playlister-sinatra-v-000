class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    new_slug = slug.downcase.split('-').join(' ')
    if new_slug == "aap rocky"
      new_slug = "a$ap rocky"
    end
    Artist.find_by("lower(name) = ?", new_slug)
  end
end
