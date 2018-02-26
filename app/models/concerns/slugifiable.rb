module Slugifiable
  module InstanceMethods
    def slug
      self.name.parameterize
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      model_name = slug.titleize
      self.all.detect{|model| model.name == model_name}
    end
  end

end
