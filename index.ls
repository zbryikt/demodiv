population = [
 * year: 1998, pop: 21928591
 * year: 1999, pop: 22092387
 * year: 2000, pop: 22276672
 * year: 2001, pop: 22405568
 * year: 2002, pop: 22520776
 * year: 2003, pop: 22604550
 * year: 2004, pop: 22689122
 * year: 2005, pop: 22770383
 * year: 2006, pop: 22876527
 * year: 2007, pop: 22958360
 * year: 2008, pop: 23037031
 * year: 2009, pop: 23119772
 * year: 2010, pop: 23162123
 * year: 2011, pop: 23224912
 * year: 2012, pop: 23315822
 * year: 2013, pop: 23373517
 * year: 2014, pop: 23433753
 * year: 2015, pop: 23492074
 * year: 2016, pop: 23539816
]
for i from 1 til population.length =>
  population[i].delta = population[i].pop - population[i - 1].pop
population
width = 800
height = 300
xScale = d3.scale.ordinal!
  .domain population.map -> it.year
  .rangeBands [0, 800]
yScale = d3.scale.linear!
  .domain [0, 200000]
  .range [height,0]
xBand = xScale.rangeBand!
sel = d3.select \#svg .selectAll \path .data population
sel.enter!append \path
  .attr do
    fill: \#c42
    d: (d,i) -> 
      [
        \M, xScale(d.year), yScale(0),
        \L, xScale(d.year) + xBand - 2, yScale(0),
        \L, xScale(d.year) + xBand - 2, yScale(d.delta)
        \L, xScale(d.year), yScale(d.delta)
        \Z
      ].join(" ")

