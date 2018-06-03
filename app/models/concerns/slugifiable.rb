class Slugifiable

    def slug
        self.name.gsub(" ", "-")
    end

end
