require 'fson/loader'

ActionDispatch::Callbacks.to_prepare do
  ::Fson::Loader::configure([])
end