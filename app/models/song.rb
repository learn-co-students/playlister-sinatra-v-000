class Song<ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

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
    if Song.all.map{|song| song.name}.include?(name)
      return Song.all.select{|song| song.name==name}
    elsif Song.all.map{|song| song.name.split(" ").map{|word| word.capitalize}.join(" ")}.include?(name)
      return Song.all.select{|song| song.name.split(" ").map{|word| word.capitalize}.join(" ")==name}
    else
      return nil
    end
  end
end
