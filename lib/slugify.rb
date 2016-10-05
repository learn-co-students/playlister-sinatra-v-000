module Slugify
  module InstanceMethods
    def slug
      slugified_name = name.downcase.gsub(/[^a-zA-z]/,"-")
    end
  end

  module ClassMethods
    def find_by_slug(slugified_name)
      self.all.find {|a| a.slug == slugified_name}
    end
  end
end
