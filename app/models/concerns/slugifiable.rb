module Concerns
  module Slugifiable #Use Include
    def slug #Instance method
      title = self.name
      conj = ["for", "and", "or", "nor", "but", "yet", "so"] #Remove conjunctions
      conj.collect! {|conj| "\b"+conj} #Add "\b" to only pick independent word conjunctions and not embedded in a word
      #result = title.downcase.strip.gsub(Regexp.union(conj), '').squeeze(" ").gsub(' ', '-').gsub(/[^\w-]/, '')
      result = title.downcase.strip.gsub(Regexp.union(conj), '').squeeze(" ").gsub(' ', '-').gsub(/[^\w-]/, '').squeeze("-")
    end
  end

  module Findable #Use Extend
    def find_by_slug(slug) #Class method
      result = {}
      self.all.each do |object|
        if object.slug == slug
          result = object
        end
      end
      result
    end
  end
end
