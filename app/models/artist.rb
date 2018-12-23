class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    camel_slug = self.name.gsub! " ", "-"
    camel_slug.downcase
  end
end
