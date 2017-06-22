
module Concerns


#-------------------------------------------------------
module Slugify_class
#explicit self still refers to class here

    def find_by_slug (slug)
      self.all.find {|instance| instance.slug == slug}    
      end

end #end of Slugify_class
      
      
      




#-------------------------------------------------------
module Slugify_instance
#explicit self still refers to class here

      def slug 
      
          @name = self.name
          @name = @name.gsub(/\s/,'-')
      
      @name.gsub(/[^0-9A-Za-z-]/,'').downcase
      end


      
end #end of Slugify_instance




end #end of main module