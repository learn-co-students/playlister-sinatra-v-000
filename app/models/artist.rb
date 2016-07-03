class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs


  def slug
    name.split(" ").join("-").downcase
  end

  def self.find_by_slug(arg)
    self.all.find do |a|
      a.slug == arg
    end
  end

end
