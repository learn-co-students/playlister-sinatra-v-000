module Slugifiable
  module InstanceMethods

    def slug
      name = self.name
      name.strip.downcase.gsub(/[^a-zA-Z\d]/, "-").gsub(/\-{2,}/, "-")  
    end

  end

  module ClassMethods

    def find_by_slug(slug)
      self.all.detect { |object| object.slug == slug }

      ## SECOND ATTEMPT (using #slug method)
      # self.all.each do |object|
      #   name_slug = object.slug
      #   if name_slug == slug
      #     return object
      #   end
      # end

      ## FIRST WORKING ATTEMPT (does not use #slug method)
      # name_array = slug.split("-")
      # name = name_array.map do |word|
      #   word.capitalize
      # end.join(" ")
      # self.find_by(name: name)
    end

  end
end