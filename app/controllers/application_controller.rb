class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/error' do
    erb :error
  end

  # I tried to refactor my index.erb files with the helper method below, but it didn't work.

  # helpers do
    # def list_all(objs)
      # This, at least, works:
      # <<~HEREDOC
      #   <h3>Will this print? Answer: yes</h3>
      #   <h3>Available #{type_of(objs)}:</h3>
      # HEREDOC

      # This is still problematic:      
      # <<~HEREDOC
      #   <ol>
      #     #{obj_list(objs).each {|obj| obj} }
      #   </ol>
      # HEREDOC
    # end

    # def type_of(objs)
    #   objs.first.class.name.downcase + "s"
    # end
# 
    # def obj_list(objs)
    #   objs.sort_by{ |obj| obj.name }.collect do |obj|
    #     "<li>#{individual_object(obj)}</li>"
    #   end
    # end
# 
    # def individual_object(obj) # I think this causes an infinite loop, or close to one.
    #   '<a href="/<%= type_of(objs) %>/<%= obj.slug %>"><%= obj.name %>'
    # end
  # end
end
