
TimePeriod = require "../../TimePeriod"

class MonsterDay extends TimePeriod

  constructor: ->
  
  @dateName = "Day of Monsters"
  @desc = "+10% all monster stats"

  @dexPercent: (character) -> 10 if not character.playerManager
  @strPercent: (character) -> 10 if not character.playerManager
  @intPercent: (character) -> 10 if not character.playerManager
  @wisPercent: (character) -> 10 if not character.playerManager
  @agiPercent: (character) -> 10 if not character.playerManager
  @conPercent: (character) -> 10 if not character.playerManager
  @luckPercent: (character) -> 10 if not character.playerManager

module.exports = exports = MonsterDay