module Slugify
  module ClassMethods
    def find_by_slug(slug)
      name = slug.split("-").each {|word|
      word.capitalize!}.join(" ").strip
      self.find_by_name(name)
    end
  end

  module InstanceMethods
    def slug
      self.name.split(" ").map {|word|
      word.downcase}.join("-")
    end
  end
end
