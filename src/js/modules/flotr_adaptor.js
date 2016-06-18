// http://esa-matti.suuronen.org/blog/2013/03/22/journey-from-requirejs-to-browserify/

// Flotr2 needs these libraries as global objects.
window._ = require('underscore');
window.bean = require('bean');

require('flotr2');
module.exports = Flotr;
