class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs


  @@slug_name = Hash.new

  def slug
    @slug = self.name.downcase.gsub(" ", "-")
    self.save
    @slug
  end

  def self.find_by_slug(slug)
    self.all.find(slug) {|name| name.slug == slug}
  end

end
