class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    # /[A-Za-z\s]/.match(name)
    # name.downcase.split.grep(/[A-Za-z\s]/).join("-")  #??????not sure about this???????
    name.downcase.split.join("-")
  end

  def self.find_by_slug(slug)
    # slug = "taylor-swift"
    # binding.pry
    self.all.find{|art| art.slug == slug}
  end
end
