module Pagescript
  module TagsHelper
    # Generates a `<body>` tag
    # with HTML5 data attributes for the controller & action name.
    # The keyword arguments are forwarded to tag and content_tag.
    # @see http://api.rubyonrails.org/classes/ActionView/Helpers/TagHelper.html ActionView::Helpers::TagHelper
    # @return [String]
    # @example when called without a block
    #   body_tag
    #   =>  <body data-controller="foo" data-action="bar">
    # @example when called with a block
    #   body_tag { 'hello world' }
    #   =>  <body data-controller="foo" data-action="bar">Hello World</body>
    # @example when called with keyword arguments
    #   body_tag(foo: 'bar', data: { x: 2 })
    #   =>  <body data-controller="foo" data-action="bar" foo="" data-x="2">
    # @option [Boolean] params_as_metadata
    # @since 0.1.0
    # @api
    def body_tag(params_as_metadata: false, **kwargs)
      options = kwargs.deep_merge(
        data: {
          controller: controller_name,
          action: action_name
        }
      )
      if params_as_metadata
        # Set each param as data-params-foo="bar"
        {}.tap do |h|
          h.merge! self.request.path_parameters.except(:controller, :action)
          h.merge! self.request.query_parameters.except(:controller, :action)
        end.each do |k,v|
          options[:data]["params-#{k}"] = v
        end
      end

      if block_given?
        content_tag(:body, options) { yield }
      else
        tag(:body, options, true)
      end
    end
  end
end
