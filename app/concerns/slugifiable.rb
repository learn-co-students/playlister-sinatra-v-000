module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ","-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find {|instance| instance.name.downcase == slug.split("-").map!{|slug| slug}.join(" ")}
    end
  end
end
