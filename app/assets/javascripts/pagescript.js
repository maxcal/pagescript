//= require jquery
var Pagescript = (function(ps, $){
  var $doc = $(document);

  // "private" methods
  function namespace(str){
    return str.match(/pagescript:/) ? str : 'pagescript:' + str;
  }

  function template(str, obj){
    return str.replace('controller', obj.controller)
              .replace('action', obj.action);
  }

  function trigger(str, data){
    var evt = template(str, data);
    return $doc.trigger(namespace(evt), data);
  }

  function parseEvents(str) {
    return jQuery.map(str.split(' '), function(s){
      return namespace(s);
    }).join(' ');
  }

  // Integrate with turbolinks
  // 'page:change' is the turbolinks-classic api
  // 'turbolinks:load' is the Turbolinks 5+ api
  $doc.on('page:change turbolinks:load', function(){
    $doc.trigger('pagescript:load');
  });

  /**
  * Adds the main event handler
  * @api
  * @return this [Object]
  */
  ps.start = function() {
    ps.stop();
    $doc.on('pagescript:load', function(){
      var data = $('body').data();
      trigger('controller#action', data);
      trigger('controller', data);
      trigger('#action', data);
    });
    return ps;
  };
  /**
  * Halts any Pagescript events from being fired - does not remove the handlers.
  * @api
  * @return this [Object]
  **/
  ps.stop = function(){
    $doc.off('pagescript:load');
    return this;
  };
  /**
  * Used to start hook Pagescript to the `document.ready`
  * event in the absense of Turbolinks.
  * @api
  * @return this [Object]
  **/
  ps.kickstart = function(){
    $doc.ready(function(){ $doc.trigger('pagescript:load'); });
    return this;
  };
  /**
  * Attaches an event handler to a controller, a particular action or any action.
  * @api
  * @param events [String]
  * @param selector [String] optional
  * @param data [Object] optional
  * @param handler [Function]
  * @return this [Object]
  **/
  ps.on = function( events, selector, data, handler ){
    var args = $.makeArray( arguments );
    args[0] = parseEvents(args[0]);
    $doc.on.apply($doc, args);
    return this;
  };
  /**
  * @api
  * @param events [String]
  * @param selector [String] optional
  * @param handler [Function]
  * @return this [Object]
  **/
  ps.off = function( events, selector, handler ){
    var args = $.makeArray( arguments );
    args[0] = parseEvents(args[0]);
    $doc.off.apply($doc, args);
    return this;
  };
  /**
  * @api
  * @param events [String]
  * @param selector [String] optional
  * @param data [Object] optional
  * @param handler [Function]
  * @return this [Object]
  **/
  ps.one = function( events, selector, data, handler ){
    var args = $.makeArray( arguments );
    args[0] = parseEvents(args[0]);
    $doc.one.apply($doc, args);
    return this;
  }

  // Export module
  return ps.start();
}(Pagescript || {}, jQuery));
