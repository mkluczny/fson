## Description

Fson is a fluent builder for simple JSON API responses

[![Build Status](https://travis-ci.org/mkluczny/fson.svg?branch=develop)](https://travis-ci.org/mkluczny/fson)
[![Dependency Status](https://gemnasium.com/mkluczny/fson.svg)](https://gemnasium.com/mkluczny/fson)
[![Code Climate](https://codeclimate.com/github/mkluczny/fson/badges/gpa.svg)](https://codeclimate.com/github/mkluczny/fson)
[![Test Coverage](https://codeclimate.com/github/mkluczny/fson/badges/coverage.svg)](https://codeclimate.com/github/mkluczny/fson/coverage)

## Installation

Add this line to your application's Gemfile:

    gem 'fson'

for Rails projects also
 
    rails g fson:install
    
## Usage

Create response builder

```ruby
Fson::Response.new()                # {}
```
    
with given status

```ruby
Fson::Response.new('failure')       # {"status": "failure"}
```
    
or use one of predefined factory methods

```ruby
Fson::Response.success              # {"status": "success"}
Fson::Response.error                # {"status": "error"}
Fson::Response.fail                 # {"status": "fail"}
```
    
then add some data explicitly 

```ruby
.data_array([{:id => 12}])                  
```

```json
{
    "data": [{
          "id": 12
     }]
}
```

```ruby
.data_hash({:id => 12})
```

```json
{
    "data": {
          "id": 12
     }
}
```

    
or by defining block

```ruby
.data_array { |data|
    data << {:id => 12}
}                                   
```

```json
{
    "data": [{
        "id": 12
    }]
}
```

```ruby
.data_hash { |data|
    data[:id] => 12
}                                   
```

```json
{
    "data": {
        "id": 12
    }
}
```
    
optionally add errors

```ruby
.add_error('not authorized') { |e| 
    e[:code] = 401
}.add_error('null pointer exception')
```

```json
{ 
    "errors": [
        {
            "message": "not authorized",
            "code": 401
        },
        {
            "message": "null pointer exception"
        }
    ]
}
```
    
and finally get JSON with

```ruby
.as_json
```
    
## Example

Builder chain

```ruby
Fson::Response.fail.data_array {|data| data << {:id => 12}}.add_error('not authorized').as_json
```
    
will return

```json
{
    "status": "fail", 
    "data": [{
        "id": 12
    }],
    "errors": [
        {
            "message": "not authorized"
        }
    ]
}
```    

## More builder methods

```ruby
.success()          # sets status to :success
.error()            # sets status to :error
.fail()             # sets status to :fail

.status('failure')  # sets status
```



## Custom builders

You can add custom builder methods using builder private methods

```ruby
_response                   # returns response hash
_errors                     # returns errors hash
_data                       # returns data hash
_initialized_data_array     # returns existing data array or initializes it with empty array
_initialized_data_hash      # returns existing data hash or initializes it with empty hash
```

For example you can add builder

```ruby
module MyCustomBuilder
    
    def attribute(value)
        _initialized_data_array << {
            :attribute => 'value'
        }
        self
    end
end
```

by registering it in initializer
 
```ruby
require 'fson/loader'

ActionDispatch::Callbacks.to_prepare do
  ::Fson::Loader::configure([MyCustomBuilder])
end
```
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request