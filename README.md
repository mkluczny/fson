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
    
then add some data by passing hash

```ruby
.data({:id => 12})                  
```

```json
{
    "data": {
          "id": 12
     }
}
```
    
or defining block

```ruby
.data { |data|
    data[:id] = 12
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
Fson::Response.fail.data {|data| data[:id] = 12}.add_error('not authorized').as_json
```
    
will return

```json
{
    "status": "fail", 
    "data": {
        "id": 12
    },
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

You can add custom builder methods operating on response hash objects

```ruby
@_response      # top level response hash
@_data          # data hash
@_errors        # errors hash
```

For example you can add builder

```ruby
module MyCustomBuilder
    
    def attribute(value)
        @_data[:attribute] = value
        self
    end
end
```

by registering it in initializer
 
```ruby
require 'fson/loader'

::Fson::Loader::configure([MyCustomBuilder])
```
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request