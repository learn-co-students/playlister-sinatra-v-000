class Genre 

    attr_accessor :genre, :id

    def initialize(genre, id)
        @genre= genre
        @id= id
    end

    def self.create(name)
    @name= name
    end

end