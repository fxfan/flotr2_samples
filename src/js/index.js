
var $ = require('jquery');
var flotr = require('./modules/flotr_adaptor');

var wins = [[
  [2006, 13],
  [2007, 11],
  [2008, 15],
  [2009, 15],
  [2010, 18],
  [2011, 21],
  [2012, 28]
]];

$(function() {
  flotr.draw(document.getElementById('chart'), wins, {
    bars: {
      show: true
    }
  });
});
