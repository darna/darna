// Grabbed from https://github.com/umdjs/umd/blob/master/amdWeb.js.
// Check out https://github.com/umdjs/umd for more patterns.

// Defines a module "darna-js".
// Note that the name of the module is implied by the file name. It is best
// if the file name and the exported global have matching names.

// If you do not want to support the browser global path, then you
// can remove the `root` use and the passing `this` as the first arg to
// the top function.

'use strict';

;(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(factory);
  } else if (typeof exports === 'object') {
    module.exports = factory()
  } else {
    root.Darna = factory();
  }
}(this, function () {
  var Darna = {};

  Darna.version = '0.0.1';

  // Default settings
  var settings = Darna.settings = {
    endpoint: 'http://darna-app.herokuapp.com',
    project: '',
    authToken: ''
  }

  Darna.configure = function(options) {
    var key, value;
    for (key in options) {
      value = options[key];
        if (value !== undefined && options.hasOwnProperty(key)) settings[key] = value;
    }

    return this;
  };

  Darna.ping = function() {
    var url =  settings.endpoint + '/api/p/' + settings.project + '/ping'
    $.ajax({
      method: 'GET',
      url: url,
      data: {
        auth_token: settings.authToken
      },
      success: function(data) {
        console.log('ok ', data);
      },
      error: function(data) {
        console.log('err ', data);
      }
    });
  }

  Darna.store = function(name, payload) {
    if (!settings.project || !settings.authToken) throw('Hmm, looks like you havent properly configured me');

    var url =  settings.endpoint + '/api/p/' + settings.project;

    $.ajax({
      method: 'POST',
      url: url,
      origin: '*',
      dataType: 'json',
      data: {
        name: name,
        value: payload,
        auth_token: settings.authToken
      },
      success: function(data) {
        console.log('ok ', data);
      },
      error: function(data) {
        console.log('err ', data);
      }
    });
  }

  Darna.retrieve = function(name) { 
    var url =  settings.endpoint + '/api/p/' + settings.project + '/' + name;

    console.log(url);
    $.getJSON(url).done(function(data) {
      console.log(data);
    });
  }

  var self = this;
  Darna.test = function() {
    Darna.configure({
      project: 'cr',
      authToken: "4b2d547ec08efb04fbf341bb947a7ae0"
    });

    var payload = {
      name: 'maytaoba',
      value: {
        maytaoba: 'galing ako kay darna-js'
      }
    }

    Darna.retrieve('maytaoba');
  };

  return Darna;
}));
