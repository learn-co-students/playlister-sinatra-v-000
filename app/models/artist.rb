class Artist< ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    slug=self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    name=slug.split("-").map {|word| word.capitalize}.join(" ")
    #puts name
    #binding.pry
    return find_by_name(name).first
  end

  def self.find_by_name(name)
    if Artist.all.map{|artist| artist.name}.include?(name)
      return Artist.all.select{|artist| artist.name==name}
    elsif Artist.all.map{|artist| artist.name.split(" ").map{|word| word.capitalize}.join(" ")}.include?(name)
      return Artist.all.select{|artist| artist.name.split(" ").map{|word| word.capitalize}.join(" ")==name}
    else
      return nil
    end
  end
end
