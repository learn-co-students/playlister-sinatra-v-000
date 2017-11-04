module Slugifiable
  module InstanceMethods
    def slug
      name.downcase.split.join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      words_to_ignore = ["a", "with", "the"]
      name = slug.split("-").each do |word|
        word.capitalize! unless words_to_ignore.include?(word)
      end.join(' ')
      self.all.detect { |o| o.name == name }
    end
  end
end
