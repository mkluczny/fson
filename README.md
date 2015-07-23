## Description

Fson is a simple fluent builder for JSON API responses

[![Build Status](https://travis-ci.org/mkluczny/fson.svg?branch=develop)](https://travis-ci.org/mkluczny/fson)
[![Dependency Status](https://gemnasium.com/mkluczny/fson.svg)](https://gemnasium.com/mkluczny/fson)
[![Code Climate](https://codeclimate.com/github/mkluczny/fson/badges/gpa.svg)](https://codeclimate.com/github/mkluczny/fson)

## Installation

Add this line to your application's Gemfile:

    gem 'fson'
    
## Usage

Create response builder

```ruby
Fson::Response.new()                # {}
```
    
with given status

```ruby
Fson::Response.new('failure')       # {'status': 'failure'}
```
    
or use one of predefined factory methods

```ruby
Fson::Response.success              # {'status': 'success'}
Fson::Response.error                # {'status': 'error'}
Fson::Response.fail                 # {'status': 'fail'}
```
    
then add some data by passing hash

```ruby
.data({:id => 12})                  
```

```ruby
# {
#     ...
#     'data': {'id': 12}
#     ...
# }
```
    
or defining block

```ruby
.data { |data|
    data[:id] = 12
}                                   
```

```ruby
# {
#     ...
#     'data': {
#         'id': 12
#     }
#     ...
# }
```
    
optionally add errors

```ruby
.error('not authorized') { |error| 
error[:code] = 401
}
.error('null pointer exception')
```

```ruby
# { 
#     ...
#     'errors': [
#         {
#             'message': 'not authorized',
#              'code': 401
#         },
#         {
#             'message': 'null pointer exception'
#         }
#     ]
#     ...
# }
```
    
and finally get JSON with

```ruby
.as_json
```
    
## Example

Builder chain

```ruby
Fson::Response.fail.data {|data| data[:id] = 12}.error('not authorized').as_json
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
    
