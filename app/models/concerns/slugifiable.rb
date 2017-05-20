module Slugifiable
  module InstanceMethods
    def slug
      self.name.strip.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      name = slug.split("-").map { |word| word.downcase }.join(" ")
      self.all.find { |instance| instance.name.downcase == name }
    end
  end
end