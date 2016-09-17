module Slugify

  module ClassMethod
    def find_by_slug(slugged)
      slug_array = slugged.scan(/[a-z0-9]+/)
      reverse_slug_array = []
      slug_array.each do |word|
        reverse_slug_array << word.capitalize
      end
      reverse_slug = reverse_slug_array.join(" ")
      self.find_by(name: reverse_slug)
    end

  end

  module InstanceMethod
    def slug
      strip_chars_array = self.name.downcase.scan(/[a-z0-9]+/)
      final_slug = strip_chars_array.join("-")
    end
  end

end
