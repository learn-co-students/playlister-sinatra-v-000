require_relative './environment'

require 'pry'
#========================pry patches========================== 
# quick next pry
Pry::Commands.alias_command 'n', 'exit'
#------------------------------------------------------------- 
# quick exit
def x; exit!; end  
#=======================ruby patches========================== 
# replaces include
class Module
  def can(*modules)
    modules.each(&method(:include))
  end
end

# replaces extend
class Module
  def can_also(*modules)
    modules.each(&method(:extend))
  end
end


