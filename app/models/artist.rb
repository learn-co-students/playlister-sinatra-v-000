class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name = self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slugname)
    # binding.pry
    self.all.find {|item| item.slug==slugname}

  end
end
