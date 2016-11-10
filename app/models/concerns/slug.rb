module Slug
  module InstanceMethod
    def slug
      self.name.downcase.gsub(/[\s\W]/, " "=>"-")
    end
  end

  module ClassMethod
    def find_by_slug(slug)
      self.all.detect{|instance| instance.slug == slug}
    end
  end
end
