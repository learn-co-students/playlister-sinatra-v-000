class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    slug = self.name.gsub(/[^a-zA-Z]/,'-').downcase
  end

  def self.find_by_slug(slug_to_find)
    Artist.all.find {|a| a.slug === slug_to_find}
  end

end
