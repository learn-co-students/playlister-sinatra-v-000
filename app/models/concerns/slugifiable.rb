module Slugifiable

  module ClassMethods
    def find_by_slug(slug)
      name = slug.split("-").each do |word|
        word.capitalize!
      end.join(" ")
      self.all.find_by_name(name)
    end
  end

  module InstanceMethods
    def slug
      self.name.split(" ").map do |word|
        word.downcase
      end.join("-")
    end
  end

end
