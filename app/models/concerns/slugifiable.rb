module Slugifiable
    module InstanceMethods
        def slug 
            self.name.downcase.gsub(/[^\s\w]/,"").gsub(/\s/, "-")
        end
    end

    module ClassMethods
        def find_by_slug(slug)
            instance = self.new
            if instance.is_a?(Artist)
                Artist.all.collect { |artist|
                    if artist.slug == slug
                        artist
                    end
                }.compact.first
          
            elsif instance.is_a?(Genre)
                Genre.all.collect { |genre|
                    genre if genre.slug == slug
                }.compact.first

            elsif instance.is_a?(Song)
                Song.all.collect { |song|
                    song if song.slug == slug
                }.compact.first

            else
                raise instance.inspect
            end            
        end
    end

end