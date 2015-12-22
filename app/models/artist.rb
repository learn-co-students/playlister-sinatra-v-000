class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, :through => :songs

  def slug
    self.name.gsub(/\ /,"-").downcase
  end

  def self.find_by_slug(slug)
    self.all.select{|inst| @fin = inst.name if inst.slug == slug}
    self.find_by(:name => @fin)
  end

end
