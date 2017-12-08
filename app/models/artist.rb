class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name = self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slugname)
    # binding.pry
    name1 = slugname.split("-").collect do |item|
      size = item.size-1
      item[0].upcase+item[1,size]
    end
    Artist.find_by_name(name1.join(" "))
  end
end
