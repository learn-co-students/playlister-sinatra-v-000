class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(sluggedstring)
    #binding.pry
    @array1 = []
      self.all.each do |inst|
        if inst.slug == sluggedstring
        @array1 << inst
        end
      end
      if !@array1.empty?
      @array1[0]
      end
  end

end
