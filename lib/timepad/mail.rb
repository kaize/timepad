module Timepad
  class Mail < Base

    def initialize(timepad_client)
      @client = timepad_client
    end

    # Create and send mail
    #
    # @param attrs [Hash] mail attributes
    # @return [Array]
    def create attrs
      params = {}
      params[:name] = attrs[:subject] if attrs.has_key?(:subject)
      params[:text] = attrs[:text] if attrs.has_key?(:text)
      params[:e_id] = attrs[:event] if attrs.has_key?(:event)
      params[:reply_to] = attrs[:reply_to] if attrs.has_key?(:reply_to)
      params[:template] = attrs[:template] if attrs.has_key?(:template)
      params[:org_info] = attrs[:org_info] if attrs.has_key?(:org_info)

      if attrs.has_key?(:subscribers)
        i = 0
        attrs[:subscribers].each do |email|
          params["a#{i}".to_sym] = email
          i += 1
        end
      end

      attrs[:maillists] ||= []
      if attrs.has_key?(:maillist)
        attrs[:maillists] << attrs[:maillist]
      end

      i = 0
      attrs[:maillists].each do |maillist_id|
        params["m#{i}".to_sym] = maillist_id
        i += 1
      end

      request 'create', params
    end

  end
end
