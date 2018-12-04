module Slugifiable

  module InstanceMethods
    def slug
      name_array = self.name.split(' ')
      array_downcase = name_array.collect {|word|word.downcase}
      array_downcase.join('-')
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.select {|instance|instance.slug == slug}[0]
    end
  end

end