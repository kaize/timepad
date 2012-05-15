module Timepad
  autoload :Base, 'timepad/base'
  autoload :Version, 'timepad/version'
  autoload :Maillist, 'timepad/maillist'
  autoload :Event, 'timepad/event'
  autoload :Config, 'timepad/config'

  extend Config
end
