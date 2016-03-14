require_relative "./config/environment"

def reload!
   load "./config/environment.rb" 
end

Pry.start