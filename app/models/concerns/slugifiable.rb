
module Slugifiable
  module InstanceMethods
    def slug
      # remove leading and trailing spaces & replace multiple spaces with a single space(.squish)
      # Remove all punctuations & replace spaces with a dash
      self.name.downcase.squish.gsub(/(^\s+|[^a-zA-Z0-9 ]+|\s+$)/,"").gsub(" ","-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find{ |instance| instance.slug == slug }
    end
  end
end
