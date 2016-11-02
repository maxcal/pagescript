module Pagescript
  # A helper that creates elements with metadata attached as data attributes.
  module TagsHelper
    # Generates a `<body>` tag
    # with HTML5 data attributes for the controller & action name.
    # The keyword arguments are forwarded to tag and content_tag.
    # @see http://api.rubyonrails.org/classes/ActionView/Helpers/TagHelper.html ActionView::Helpers::TagHelper
    # @return [String]
    # @yield Yields flow to an optional block.
    #   Using a block adds a closing </body> tag.
    # @param [Boolean] params_as_metadata default: false.
    #   Includes params from the URL as data attributes.
    #   The data attributes are prefixed with `param-`.
    #   Underscores in the param name are converted to '-'.
    # @example when called without a block
    #   body_tag
    #   =>  <body data-controller="foo" data-action="bar">
    # @example when called with a block
    #   body_tag { 'hello world' }
    #   =>  <body data-controller="foo" data-action="bar">Hello World</body>
    # @example when called with keyword arguments
    #   body_tag(foo: 'bar', data: { x: 2 })
    #   =>  <body data-controller="foo" data-action="bar" foo="" data-x="2">
    # @example when params_as_metadata is true
    #   body_tag(params_as_metadata: true)
    #   =>  <body data-controller="foo" data-action="bar" data-params-user-id="2">
    # @since 0.1.0
    # @api
    def body_tag(params_as_metadata: false, **kwargs)
      options = kwargs.deep_merge( data: data_attrs(params_as_metadata) )
      if block_given?
        content_tag(:body, options) { yield }
      else
        tag(:body, options, true)
      end
    end

    private

    def data_attrs(params_as_metadata = false)
      {
        controller: controller_name,
        action: action_name
      }.tap do |hash|
        if params_as_metadata
          params_from_url.each do |k, v|
            hash["params-#{k}"] = v
          end
        end
      end
    end

    def params_from_url
      {}.tap do |h|
        h.merge! request.path_parameters
        h.merge! request.query_parameters
      end.except(:controller, :action)
    end
  end
end
