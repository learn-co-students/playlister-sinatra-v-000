module Slug
  module InstanceMethods

    def slug
      self.name.downcase.split(" ").join("-")
    end

  end

  module ClassMethods

    # def find_by_slug(slug)
    #   name = slug.split("-").map do |word|
    #     word.capitalize
    #   end.join(" ")
    #   find_by_name(name)
    # end

    def find_by_slug(slug)
      self.all.find { |obj| obj.slug == slug }
    end

  end
end
