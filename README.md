# Pagescript

So you're ready to put on the big girl/boy pants and stop using inline
script tags in your views?

Can't figure out how to hook javascript to specific actions in your Rails app?

Pagescript can help. It fires custom events based on what controller / action
was called and makes it simple to add event handlers.

Pagescript is intended for classical web applications where Rails
handles rendering views. SPA's have better mechanisms for this anyways.

It is designed to integrate seamlessly with [Turbolinks](https://github.com/turbolinks/turbolinks).

## Dependencies
- Sprockets
- jQuery
- Turbolinks (optional)

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'pagescript'
```

And then execute:
```bash
$ bundle
```

## Usage

Replace your the body tag in your `app/views/layouts/application.html.erb`
with `<%= body_tag %>`. This adds *data* attributes that we can hook onto.

You can optionally pass the `params_as_metadata: true` option to attach
the url parameters to the body element. See [The pagescript event]

```javascript
//= pagescript
Pagescript.on('users', function(){
    console.log('some action belonging to UsersController was rendered');
  }) // all methods are chainable
  .on('users#show', function(){
    console.log('Users#show action was called');
  }) // you can remove handlers as well.
  .off('users');

// This is only required if you are not using Turbolinks
Pagescript.jumpstart();
```

Note that you should not wrap this in a `$(document).ready` callback.

## Pagescript Event types
On each page replacement (or load) Pagescript will fire multiple events that you can listen to.
`*` symbolizes a wildcard.

```JS
// A specific controller_name and action
$.on('pagescript:controller_name#action_name')
// Any action belonging to a specific controller
$.on('pagescript:controller_name#*')
// Any action matching action_name
$.on('pagescript:*#action_name')
// Any page load
$.on('pagescript:*')
```

When using the Pagescript API methods you don't need to include the `pagescript:`
"namespace".

## The Pagescript Event
The [Event object](https://api.jquery.com/category/events/event-object/) which
is passed to event handlers has the following extra properties:

- controller [String]
- action [String]
- params [object]

The params object is only populated if you have used the `params_as_metadata: true` option.

```erb
<%= body_tag(params_as_metadata: true) %>
```

The param keys are cast to `camelCase` by jQuery.

## Javascript API
All methods return the Pagescript module and can be chained.

When using the Pagescript API methods you don't need to include the `pagescript:`
"namespace" in the event name.

`on`, `off` and `one` proxy to their jQuery counterparts. Please see the jQuery
documentation for more details.

### Pagescript.kickstart
Used to start hook Pagescript to the `document.ready` event in the absense of
Turbolinks

### Pagescript.off
Removes all handlers for the given event.
See [jQuery.off](http://api.jquery.com/off/)

### Pagescript.on
Attaches an event handler to a controller, a particular action or any action
matching the name.

```JS
Pagescript.on('foo#bar', function(e){
  console.log( e.controller, e.action_name, e.params );
  // "foo", "bar", {}
});
```

See [jQuery.on](http://api.jquery.com/on/)

### Pagescript.one
Like `.on`, but the handler only fires once.

See [jQuery.one](http://api.jquery.com/one/)

### Pagescript.start
Adds the main event handler which Pagescript hinges on.

### Pagescript.stop
Halts any Pagescript events from being fired - does not remove user created handlers. Call `.start` to reverse the effect.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
