module Slugifiable
  module InstanceMethods
    def slug
      self.name.split(" ").join("-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      name = slug.split("-").join(" ")
      self.where("lower(name) = ?", name.downcase).limit(1).first
    end
  end
end