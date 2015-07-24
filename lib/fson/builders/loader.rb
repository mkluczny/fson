require 'fson/response'

module Fson
  module Builders
    module Loader

      def configure(classes)
        classes.each { |clazz|
          Fson::Response.class.send(:include, clazz)
        }
      end
    end
  end
end