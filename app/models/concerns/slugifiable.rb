module Slugifiable

  module InstanceMethods
    def slug
      self.name.strip.downcase.gsub(' ','-')
    end
  end

  module ClassMethods
    def find_by_slug(arg)
      self.all.find{|inst| inst.slug == arg}
    end
  end
end