module Slugifiable

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    name = slug.gsub(/-/, " ").split(" ").map do |word|
      word.capitalize
    end.join(" ")
    self.find_by(name: name)
  end
  
end