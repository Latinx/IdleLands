
Class = require "./../base/Class"

class Fighter extends Class

  baseHp: 120
  baseHpPerLevel: 20
  baseHpPerCon: 8

  baseMp: 2
  baseMpPerLevel: 2
  baseMpPerInt: 1

  baseConPerLevel: 3
  baseDexPerLevel: 2
  baseAgiPerLevel: 2
  baseStrPerLevel: 3
  baseIntPerLevel: 2
  baseWisPerLevel: 1

  itemScore: (player, item) ->
    item.str*1.1 +
    item.con*0.8 +
    item.dex*0.3 -
    item.agi*0.2 -
    item.wis*0.8

  hpregen: (player) -> Math.floor(player.hp.maximum*0.05)

  minDamage: (player) ->
    player.calc.damage()*0.50

  load: (player) ->
    super player

module.exports = exports = Fighter