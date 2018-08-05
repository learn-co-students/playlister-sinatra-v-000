class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs


  def slug
    # binding.pry
    x = self.name.split(" ")
    x = x.collect do |word|
      word.downcase
    end
    x.join("-")
  end


  def self.find_by_slug(slug)
    # binding.pry
    # x = slug.split("-").collect do |word|
    #   word.capitalize
    # end
    # artist_name = x.join(" ")
    # Artist.find_by_name(artist_name)
    Artist.all.detect{|artist| artist.slug == slug}

  end
end
