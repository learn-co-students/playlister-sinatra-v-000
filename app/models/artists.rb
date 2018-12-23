class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    new_name = self.name.downcase
    new_name.gsub!(/[!@%&"]/,'')
    new_name.gsub!(/\s/,'-')
  end

  def self.find_by_slug(slug)
    self.all.each do |artist|
      if artist.slug == slug
        return artist
      end
    end
    return nil
  end
end
