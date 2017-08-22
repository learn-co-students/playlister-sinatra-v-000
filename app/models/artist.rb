class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.strip.gsub(' ','-').gsub(/[^\w-]/,'')
  end

  def self.find_by_slug(slug)
    self.all.detect {|artist| artist.slug == slug}
  end

  def self.find_id_or_create_new_by_name(name)
    artist = Artist.find_by(name: name)
    if !!artist
      artist.id
    else
      Artist.create(name: name).id
    end
  end
end
