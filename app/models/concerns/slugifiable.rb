def slug
	self.name.downcase.split(" ").join("-")
end

def self.find_by_slug(slug)
	name = slug.split("-").each{|name| name.capitalize!}.join(" ")
	Artist.find_by(name: name)
end