module Slugifiable
  module ClassMethod
    def find_by_slug(slug)
      self.where("name like ?", "%#{slug.gsub("-", " ")}%").first
    end
  end
  module InstanceMethod
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end
end
