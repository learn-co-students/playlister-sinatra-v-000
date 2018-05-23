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
      n_array = []
      n_array << array[0].capitalize
      array.each_with_index do |item, i|
        if i>0
          if item == "with" || item == "the" || item == "a" || item == "of"
            n_array << item
          else
            n_array << item.capitalize
          end
        end
      end
      n_array.join(" ")
    end

    def find_by_slug(slug)
      result = unslug(slug)
      if self.name == "Genre" && result.split.size == 1
        self.find_by_name(result.downcase)
      else
        self.find_by_name(result)
      end
    end
  end
end
