module Slug
  module InstanceMethods
    def slug
      @slug = slugify(self.name)
    end

    def slugify(name)
      split_on_apostrophes = name.split(/[']/)
      name_without_apost = split_on_apostrophes.join
      name_array = name_without_apost.downcase.split(/[\W]/)
      name_array.delete_if {|x| x == ""}
      new_name = name_array.join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.detect {|x| x.slug = slug}
    end
  end
end
