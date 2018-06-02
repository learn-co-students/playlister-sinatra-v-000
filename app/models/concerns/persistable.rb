#a dynamic module that contains data that can be re-used, hence the name
module Persistable

  module ClassMethods

    def find_by_slug(slug)
      self.all.find do |subject|
        subject.slug == slug
      end
    end

  end

  module InstanceMethods

    def slug
      self.name.downcase.gsub!(/\W|( )/, "-")
    end

  end
end
