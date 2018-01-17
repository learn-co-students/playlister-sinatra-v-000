All controllers must be "used"/"run" in the config.ru file. There are two ways (that I know of) to manage this:

### At the very end of the file...
```
use Rack::MethodOverride

use GenresController
use ArtistsController
use SongsController
run ApplicationController
```

### or...
```
Dir[File.join(File.dirname(__FILE__), "app/controllers", "*.rb")].collect {|file| File.basename(file).split(".")[0] }.reject {|file| file == "application_controller" }.each do |file|
  string_class_name = file.split('_').collect { |w| w.capitalize }.join
  class_name = Object.const_get(string_class_name)
  use class_name
end
```


  