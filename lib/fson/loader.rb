require 'fson/response'

module Fson
  module Loader
    def self.configure(classes)
      classes.each { |clazz|
        Fson::Response.send(:include, clazz)
      }
    end
  end
end