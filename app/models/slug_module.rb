module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug_name)
      all = self.all
      slug_instances = all.collect do |object|
        object.name = object.slug
        object
      end
      id = slug_instances.detect {|slug_object| slug_object.name == slug_name}.id
      self.find(id)
    end
  end
end
