class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :songs

  def slug
    self.name.parameterize
  end

  def self.find_by_slug(slug)
    self.all.find do |genre|
      if slug == genre.slug
        genre
      end
    end
  end
end
