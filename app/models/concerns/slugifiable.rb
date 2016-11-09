module Slugifiable
  module InstanceMethod
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(input)

      unsluged_array = []
      "that-one-with-the-guitar".gsub("-", " ").split.each do |word|
        binding.pry
        if word.downcase == "with" || word.downcase == "the"
          unsluged_array << word
        elsif word.downcase != "with" || word.downcase != "the"
            unsluged_array << word.capitalize
        end
      end
      unsluged_array
    end
  end
#self.find_by(name: unsluged.join(" "))
end
