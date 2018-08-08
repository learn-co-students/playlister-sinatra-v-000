class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    a = self.name.downcase
    #binding.pry
    if a.gsub!(/[!@% &"]/,'-')
      slug = a
      #binding.pry
    else
      slug = a
    end
    slug
  end

  def self.find_by_slug(slug)
    value = nil
    Artist.all.each do |artist|
      #binding.pry
      if artist.slug == slug
        #binding.pry
        #val = artist
        value = artist
      end
    end
    value
  end

end
