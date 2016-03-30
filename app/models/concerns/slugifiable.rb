module Slugifiable 

    def slug
      slugged_phrase = self.name.gsub(/\s/, "-").downcase
      slugged_phrase
    end

    def find_by_slug(slugger)
      self.all.detect do |instance|
        instance.slug == slugger
      end
    end
end
