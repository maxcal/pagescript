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

## Javascript API
Note that the pre 1.0 API will be relativly unstable. The goal is to eventually
emulate the signatures of jQuery.on & jQuery.off.

All methods return the Pagescript module and can be chained.

### `Pagescript.on`
Attaches an event handler to a controller, a particular action or any action
matching the name.
Forwards to [jQuery.on](http://api.jquery.com/on/) under the covers.

The following events are fired when a page is loaded:

- `controller_name`
- `controller_name#action_name`
- `#action_name`

### `Pagescript.one`
Like `.on`, but the handler only fires once.
Forwards to [jQuery.one](http://api.jquery.com/one/) under the covers.

### `Pagescript.off`
Removes all handlers for the given event.
Forwards to [jQuery.off](http://api.jquery.com/off/) under the covers.

### `Pagescript.kickstart`
Used to start hook Pagescript to the `document.ready` event in the absense of
Turbolinks.

### `Pagescript.stop`
Halts any Pagescript events from being fired - does not remove the handlers.


## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
