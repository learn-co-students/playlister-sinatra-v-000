module Slugifiable
  def slug
    self.name.split(" ").join("-").downcase
  end
end

module SlugifiableFind

    def find_by_slug(string)
      # if self.model_name.name != "Genre"
        array=string.split("-")
        array.each {|x| x.capitalize!}
        name=array.join(" ")
        self.find_by(name: name)
      # else
      #   self.find_by(name: string)
      # end
    end

end
