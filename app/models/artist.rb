class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.split(" ").collect {|word| word.downcase}.join("-")
  end

  def self.find_by_slug(slug)
    slug = slug.split("-").collect do |word|
      word
    end.join(" ")
    slug = self.all.find {|item| item.name.downcase == slug}
  end

  def get_root
    "#{self.class.to_s.downcase}s"
  end

end
