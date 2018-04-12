module Slugifiable

  module InstanceMethods

    def slug
      self.name.downcase.strip.gsub(' ', '-')
    end

  end

  module ClassMethods

    def find_by_slug(slug)
      #slug_arr = slug.gsub('-', ' ').split(' ')
      #slug_arr.collect! do |w|
      #  w.capitalize
      #end
      #name = slug_arr.join(' ')
      #result = self.find_by_name(name)
      @result = []
      self.all.each do |s|
        if s.slug == slug
          @result << s
        end
      end
      @result[0]
      #binding.pry 
    end

  end

end
