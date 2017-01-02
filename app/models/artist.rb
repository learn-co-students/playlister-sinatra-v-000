class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  def slug
    name.downcase.strip.gsub(' ', '-')
  end
    def self.find_by_slug (s)
    all.each{|e| if e.slug==s then return e end}
  end
end
