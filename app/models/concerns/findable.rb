module Findable

  def find_by_slug(slug)
    instances_by_slug = self.all.map{|instance| [instance.slug, instance]}.to_h
    instances_by_slug[slug]
  end

end