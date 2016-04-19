class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres

  def self.find_by_slug(arg)
    test = arg.split('-').join(' ')
    self.all.detect {|artist| artist = test} 
  end

end