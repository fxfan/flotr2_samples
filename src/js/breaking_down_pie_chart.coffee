$ = require 'jquery'
flotr = require './modules/flotr_adaptor'

original_data = [
  data: [[0, 6]]
  label: 'a'
  sub: [
    data: [[0, 2]]
    label: 'a1'
  ,
    data: [[0, 4]]
    label: 'a2'
  ]
,
  data: [[0, 4]]
  label: 'b'
  sub: [
    data: [[0, 3]]
    label: 'b1'
  ,
    data: [[0, 1]]
    label: 'b2'
  ]
]

draw_pie = (container, data) ->

  flotr.draw container, data,
    title: 'Click a slice to see the details'
    pie:
      show: true
    mouse:
      track: true
      trackFormatter: (obj) -> "#{obj.series.label}: #{obj.y}"

  .observe container, 'flotr:click', (pos) ->
    obj = pos.hit
    if obj && obj.series && obj.series.sub
      draw_pie container, obj.series.sub
    else
      draw_pie container, original_data

$ -> draw_pie document.getElementById('chart'), original_data
