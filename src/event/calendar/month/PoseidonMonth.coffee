
TimePeriod = require "../../TimePeriod"

class PoseidonMonth extends TimePeriod

  constructor: ->
  
  @dateName = "Month of Poseidon"
  @desc = "Water boost"

  @water: -> 50
  @waterPercent: -> 5

module.exports = exports = PoseidonMonth