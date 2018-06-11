module Slugifiable
    module ClassMethods
        def find_by_slug (slug)
            name_from_slug = 
                (slug.split('-').each do |word|
                    word.capitalize!
                end).join(' ')

            model_instance = self.find_by(name: name_from_slug)
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