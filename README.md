#Bulldog
Ruby Library for XtremIO  

####Install and usage:
require_relative 'bulldog.rb'  

####Example usage files:
-example.rb  

####Create a XtremIO Object
``` ruby
bulldog = Bulldog.new([base_url],[user_name],[password],FALSE)
```

####Get all Volumes
``` ruby
bulldog.get_volumes
```