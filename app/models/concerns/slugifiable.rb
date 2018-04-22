module Slugifiable
  module InstanceMethods
    def slug
      name.downcase.tr(" ", "-")
    end

    def titleize(str)
    str.capitalize!  # capitalize the first word in case it is part of the no words array
    words_no_cap = ["with", "and", "or", "the", "over", "to", "the", "a", "but"]
    phrase = str.split(" ").map {|word|
        if words_no_cap.include?(word)
            word
        else
            word.capitalize
        end
    }.join(" ")
  phrase  # returns the phrase with all the excluded words
end
  end
  module ClassMethods
    def find_by_slug(slug)
      phrase = slug.tr("-", " ").capitalize!
      words_no_cap = ["with", "and", "or", "the", "over", "to", "the", "a", "but"]
      name = phrase.split(" ").map {|word|
          if words_no_cap.include?(word)
              word
          else
              word.capitalize
          end
      }.join(" ")
      self.find_by(name: name)
    end
  end
end
