class Slugifiable < ActiveRecord::Base
#module Concerns::Slugifiable
    #Slugs are generally entirely lowercase, with accented characters
    #replaced by letters from the English alphabet and whitespace characters replaced by a dash or an underscore to avoid being encoded.
    #Punctuation marks are generally removed, and some also remove short, common words such as conjunctions
    def slug
      self.name.downcase.split(/\W/).reject { |w| w.empty? }.join("-")
    end

end
