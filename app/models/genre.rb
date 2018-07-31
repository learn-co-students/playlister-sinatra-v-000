class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

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
