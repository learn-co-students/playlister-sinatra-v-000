
module Concerns::Slugifiable 

  def slug
    slug = name.split(" ").join("-").downcase
  end

  def find_by_slug(slug)
    name = slug.split("-")
	name.each {|word| word.capitalize!}
	name = name.join(" ")
    self.find_by(name: name)
  end

end
