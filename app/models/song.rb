class Song <ActiveRecord::Base

  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    self.name.gsub(/\ /,"-").downcase
  end

  def self.find_by_slug(slug)
    self.all.select{|inst| @fin = inst.name if inst.slug == slug}
    self.find_by(:name => @fin)
  end

end
