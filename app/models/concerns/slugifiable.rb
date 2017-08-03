module Slugifiable
  module InstanceMethod
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(input)

      unsluged_array = []
      input.gsub("-", " ").split.each do |word|
        if word.downcase == "with" || word.downcase == "the" || word.downcase == "a"
          unsluged_array << word
        elsif word.downcase != "with" || word.downcase != "the" || word.downcase != "a"
            unsluged_array << word.capitalize
        end
      end
      self.find_by(name: unsluged_array.join(" "))
    end

  end

end
