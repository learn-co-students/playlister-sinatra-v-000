require 'pry'
module SlugInstance
   def slug
      @slug = self.name.downcase.gsub(/\W+/,"-")
   end
end

module SlugClass
  def find_by_slug(slug)
    self.all.find do |instance|
      if !instance.name.nil?
        instance.slug == slug
      end
    end
  end
end