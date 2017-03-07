require 'pry'

# slug module

module Slugifiable
  module InstanceMethods
    def slug
      self.name.gsub(" ","-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(name)
      self.all.find{|x| x.slug == name}
    end
  end
end
