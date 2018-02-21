module Slugifiable

    module InstanceMethods

        def slug
            self.name.downcase.split.join("-")
            #self.name.split.join("-")
        end

    end

    module ClassMethods

        def find_by_slug(slug)
            name = slug.split("-")
            name = name.collect do |word|
                if word == 'with' || word == 'a' || word == 'the'
                    word
                else
                    word.capitalize
                end
            end
            name = name.join(" ")
            self.find_by(name: name)
        end

    end
end