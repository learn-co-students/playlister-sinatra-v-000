module Slugifiable

    def slug
        self.name.downcase.gsub(" ", "-")
    end
    
    module ClassMethods

        def find_by_slug(slug)
        
            # self.all.each {|obj| obj.name.downcase}
            # self.find_by(name: "#{slug.gsub("-", " ").split(" ").map{|name| name.capitalize}.join(" ")}")
            result = nil

            if !slug.empty?
                self.all.select do |obj|
                    # binding.pry
                    # obj.name.downcase
                    # if obj == self.find_by(name: "#{slug.gsub("-", " ").split(" ").map{|name| name.capitalize}.join(" ")}") 
                        # obj

                    if obj.name.downcase == slug.gsub("-", " ").split(" ").join(" ")
                        result = obj
                    end
                end
            end
            result
        end
    end
end
