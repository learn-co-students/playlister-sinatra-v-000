class Artist< ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    slug=self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    name=slug.split("-").map {|word| word.capitalize}.join(" ")
    find_by_name(name)
  end
end
