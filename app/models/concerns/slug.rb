module Slug
  module ClassMethods
    def find_by_slug(slug)
      name = slug.split("-").map{|word| word}.join("_")
      self.where("LOWER(name) LIKE LOWER(?)", name).first
    end
  end

  module InstanceMethods
    def slug
      self.name.downcase.split(" ").join("-")
    end
  end
end
