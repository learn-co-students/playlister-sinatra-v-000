class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres


  def slug
    # binding.pry
    # if self.name.split(" ").count > 1
    #   x = self.name.split(" ")
    #   x = x.collect do |word|
    #     word.downcase
    #   end
    #   x.join("-")
    # else
    #   self.name.downcase
    # end

    self.name.downcase.gsub(" ", "-")

  end


  def self.find_by_slug(slug)
    # binding.pry
    # x = slug.split("-").collect do |word|
    #   word.capitalize
    # end
    # x = slug.split("-")
    # song_name = x.join(" ")
    # Song.find_by_name(song_name)
    # binding.pry
    Song.all.detect{|song| song.slug == slug}
  end


end
