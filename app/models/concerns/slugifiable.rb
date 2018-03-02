module Slugifiable

  module InstanceMethods

def slug
  name.downcase.split.join("-")
end

end

  module KlassMethods

def find_by_slug(slug)
  self.all.find {|instance| instance.slug == slug}
end

  end
end
