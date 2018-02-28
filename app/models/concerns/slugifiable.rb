module Slugifiable
  module InstanceMethods
    def slug
      #special characters of each word will be omitted and words will be joined together by -
      self.name.downcase.split {|word| word.gsub(/[^0-9A-Za-z]/,"")}.join("-")
    end
  end
  module ClassMethods
    def find_by_slug(slug)
      #binding.pry
      self.all.detect{|instance| instance.slug==slug }
    end
  end
end
