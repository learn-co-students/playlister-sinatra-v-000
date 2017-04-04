module Slugifiable
  module SlugClass
    def find_by_slug(slug)

      if self == Genre
        # binding.pry
        return self.find_by_name(slug.gsub('-'," ").titleize)
      else
        lowcase_words = %w[with a the]
        cap_slug = slug.split("-").collect do |word|
          lowcase_words.include?(word) ? word : word.capitalize!
        end
        # binding.pry
        cap_slug[0] = cap_slug.first.capitalize
        # binding.pry
        name = cap_slug.join(' ')
      end
      # binding.pry
      self.find_by(name: name)
      # binding.pry
    end
  end


  module SlugInstance
    def slug
      self.name.downcase.gsub(" ", "-").gsub(/[()&.,]/, '')
    end
  end
end
