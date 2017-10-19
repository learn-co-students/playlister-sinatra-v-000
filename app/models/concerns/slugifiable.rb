module Slugifiable
  module InstanceMethods
    def slug
      if self.name
        self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
      else
        puts "*"*30
        puts "*"*30
        puts "name was nil"
        puts "*"*30
        puts "*"*30
      end
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.detect {|i| puts i.slug; i.slug == slug}
    end
  end
end
