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
    # @since 0.1.0
    # @api
    def body_tag(**opts)
      options = opts.deep_merge(
        data: {
          controller: controller_name,
          action: action_name
        }
      )
      if block_given?
        content_tag(:body, options) { yield }
      else
        tag(:body, options, true)
      end
    end
  end
end
