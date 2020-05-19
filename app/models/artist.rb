class Artist 

    attr_accessor :name, :song, :genre
    @@songs =[]

    def initialize(name, song, genre)
        @name= name
        @song= song
        @genre= genre
    end

    def self.create(name)
    @name= name
    end

end