module Slugify
  module ClassMethods
    def find_by_slug(slug)
      # name = slug.split("-").each {|word|
      # word.capitalize!}.join(" ").strip
      # self.find_by_name(name)
      # binding.pry
      self.all.find {|e| e.slug == slug}
    end
  end

  module InstanceMethods
    def slug
      slugged = self.name
      slugged.downcase.gsub(" ","-")
      # self.name.split(" ").map {|word|
      # word.downcase}.join("-")
    end
  end
end
