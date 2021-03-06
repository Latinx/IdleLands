
Spell = require "../../../base/Spell"

class ZeroDay extends Spell
  name: "zero-day attack"
  @element = ZeroDay::element = Spell::Element.physical
  @stat = ZeroDay::stat = "special"
  @tiers = ZeroDay::tiers = [
    {name: "zero-day threat", spellPower: 0.2, cost: 100, class: "Bitomancer", level: 20}
    {name: "zero-day attack", spellPower: 0.5, cost: 400, class: "Bitomancer", level: 40}
    {name: "zero-day assault", spellPower: 0.7, cost: 1000, class: "Bitomancer", level: 60}
  ]

  determineTargets: ->
    @targetSomeEnemies size: 1

  calcDuration: (player) ->
    super()+2

  damageReduction: -> -Math.floor(@spellPower*@caster.special.maximum)

  cast: (player) ->
    message = "%casterName exploits %targetName's defenses with a %spellName!"
    @broadcast player, message

  tick: (player) ->
    message = "%targetName is still vulnerable to %casterName's %spellName."
    @broadcast player, message

  uncast: (player) ->
    @caster.special.add switch
      when @caster.level.getValue() < 40 then 100
      when @caster.level.getValue() < 60 then 400
      else 1000
    message = "%targetName found a patch for %casterName's %spellName."
    @broadcast player, message

  constructor: (@game, @caster) ->
    super @game, @caster
    @bindings =
      doSpellCast: @cast
      doSpellUncast: @uncast
      "combat.self.turn.start": @tick

module.exports = exports = ZeroDay