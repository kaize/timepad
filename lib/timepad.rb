module Timepad
  autoload :Base,     'timepad/base'
  autoload :Version,  'timepad/version'
  autoload :Maillist, 'timepad/maillist'
  autoload :Event,    'timepad/event'
  autoload :Category, 'timepad/category'
  autoload :Config,   'timepad/config'

  extend Config
end
