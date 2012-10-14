module Timepad
  class Client

    # Initalize new API
    #
    # @param attrs [Hash]
    # @return [Timepad::Client]
    def initialize(attrs = {})
      attrs = Timepad.options.merge(attrs)
      Config::VALID_OPTIONS_KEYS.each do |key|
         instance_variable_set("@#{key}".to_sym, attrs[key])
      end
    end

    # Return Maillist object
    #
    # @return [Timepad::Maillist]
    def maillist
      @maillist ||= Timepad::Maillist.new(self)
    end

    # Return Mail object
    #
    # @return [Timepad::Mail]
    def mail
      @mail ||= Timepad::Mail.new(self)
    end

    # Category object
    #
    # @return [Timepad::Category]
    def category
      @category ||= Timepad::Category.new(self)
    end

    # Event object
    #
    # @return [Timepad::Event]
    def event
      @event ||= Timepad::Event.new(self)
    end

    def key
      @key
    end

    def id
      @id
    end
 end
end
