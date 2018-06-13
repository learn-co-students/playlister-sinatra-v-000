class Artist < ActiveRecord::Base

  has_many :song_genres
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(/[,._?!@$%#&*()+:;|\/"^' ]/, '-')
  end

  def self.find_by_slug(slug)
    Artist.all.each do |a|
      if a.slug == slug
        return a
      end
    end
  end

  # def self.find_or_create(name)
  #   if !self.find_by_name(name)
  #     Artist.create(name)
  #   end
  # end

end
