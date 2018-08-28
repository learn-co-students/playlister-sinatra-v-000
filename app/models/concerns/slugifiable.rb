module Slugifiable

  module InstanceMethods
    def slug
      value = self.name.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n, '').to_s
      value.gsub!(/[']+/, '')
      value.gsub!(/\W+/, ' ')
      value.strip!
      value.downcase!
      value.gsub!(' ', '-')
      value
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.find { |obj| obj.slug == slug }
    end
  end

end
