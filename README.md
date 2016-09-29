# Pagescript
Hook your javascript to any controller or action.

Pagescript works by emitting page specific events based on what controller and
action was requested.

Pagescript is intended for classical web applications (not SPA's) where Rails handles
rendering views.

## Usage

Replace your body tag with the Pagescript helper method `<%= pagescript_body_tag %>`. This adds a `data-controller` and `data-action` attribute to the body element.

```javascript
$(function($doc){
  // users#show
  $doc.on('users#show:load',function(event){
    console.log([event.controller, event.action]);
    // ['users', 'show']
  });
  // Any action from `UsersController`
  $doc.on('users:load',function(){
    // ..
  });
  // Any show action.
  $doc.on('show:load',function(){
    // ..
  });
});
```

## Dependencies
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

## Contributing
- by [reporting bugs you encounter](https://github.com/maxcal/pagescript/issues/new)
- by [suggesting new features](https://github.com/maxcal/pagescript/issues/new)
- by taking part in [feature and issue discussions](https://github.com/maxcal/pagescript/issues)
- by adding a failing test for reproducible [reported bugs](https://github.com/maxcal/pagescript/issues)
- by reviewing [pull requests](https://github.com/maxcal/pagescript/pulls) and suggesting improvements
- by [writing code](DEVELOPMENT.md) (no patch is too small! fix typos or bad whitespace)

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
