module Slugifiable
  module InstanceMethods
    def slug
      string = self.name.downcase.split.join("-")
      string
    end
  end

  module ClassMethods
    def unslug(slug)
      array = slug.split("-")
      n_array = array.collect {|word| word.capitalize}
      n_array.join(" ")
    end

    def find_by_slug(slug)
      result = unslug(slug)
      self.find_by_name(result)
    end
  end
end
