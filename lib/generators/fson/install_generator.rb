module Fson
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      def create_initializer
        template 'initializer.rb', File.join('config', 'initializers', 'fson2.rb')
      end
    end
  end
end