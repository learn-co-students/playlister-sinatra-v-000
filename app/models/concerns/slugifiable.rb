module Slugifiable
  attr_accessor :slug

  def slug
    self.name.downcase.gsub(/[^a-z0-9]+/, '-').chomp('-')#0-9 instead of 1?
  end
end


module Findable
  attr_accessor :slug

  def find_by_slug(slug)
    @count = 0
    if slug.include?("-")
      @new_slug = slug.split("-")
    else
      @new_slug = Array.new
      @new_slug << slug
    end
    self.all.each do |object|
      @name = object.name
      @new_slug.each do |word|
        if @name.include?(word) || @name.include?(word.capitalize)
          @count += 1
          if @count == @new_slug.length
            @match = object
          end
        end
      end
    end
  @match
  end
end

#self.find_by(name: @name)