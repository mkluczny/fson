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

    Fson::Response.new() # {}
    
with given status

    Fson::Response.new('failure').as_json # {'status': 'failure'}
    
or use one of predefined factory methods

    Fson::Response.success  # {'status': 'success'}
    Fson::Response.error    # {'status': 'error'}
    Fson::Response.fail     # {'status': 'fail'}
    
then add some data by passing hash

    Fson::Response.success.data({:id => 12}) # {'status': 'success', 'data': {'id': 12}}
    
or defining block

    Fson::Response.success.data {|data| data[:id] => 12} # {'status': 'success', 'data': {'id': 12}}
    
optionally add errors

    Fson::Response.fail.error('not authorized', 401) # {'status': 'fail', 'errors': [{'message': 'not authorized', 'id': 401}]}
    
and finally get JSON with
    
    as_json
    
