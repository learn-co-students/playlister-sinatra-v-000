class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.split(" ").collect do |t|
      t.downcase
    end.join("-")
  end

  def self.find_by_slug(arg)
    Artist.all.find do |t|
      t.slug == arg
    end
  end
end