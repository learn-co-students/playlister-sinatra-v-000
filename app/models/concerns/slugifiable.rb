module Slugifiable
    module ClassMethods
        def find_by_slug (slug)
            if self.find_by(name: slug)
                model_instance = self.find_by(name: slug)
            else
                lowercase_words = ["a", "the", "with"]

                name_from_slug = 
                    (slug.split('-').each do |word|
                        if !lowercase_words.include?(word)
                            word.capitalize!
                        end
                    end).join(' ')

                model_instance = self.find_by(name: name_from_slug)
            end
        end
    end

    def self.included(base)
        base.extend ClassMethods
    end

    def slug
        # remove anything that isn't a letter number or space
        # replace spaces with dashes
        stripped_name = self.name.gsub(/[^\w\s\d]/, '')
        dashed_name = stripped_name.gsub(/\s/, '-')
        lowercased_name = dashed_name.downcase
    end



end