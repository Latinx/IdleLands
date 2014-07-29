
Spell = require "../base/Spell"

class BluntHit extends Spell
  name: "blunt hit"
  @element = BluntHit::element = Spell::Element.normal
  @cost = BluntHit::cost = 100
  @restrictions =
    "Fighter": 13

  cantAct: -> 1

  cantActMessages: -> "%player is currently stunned"

  calcDuration: -> super()+1

  calcDamage: ->
    @chance.integer min: (@caster.calc.stat 'str')/6, max: Math.max ((@caster.calc.stat 'str')/6)+1,(@caster.calc.stat 'str')/4

  cast: (player) ->
    console.log "STUN TIEM"
    damage = @calcDamage()
    message = "#{@caster.name} used #{@name} on #{player.name} and dealt #{damage} HP damage!"
    @caster.party.currentBattle.takeHp @caster, player, damage, @determineType()
    @broadcast message

  tick: (player) ->
    message = "#{player.name} is still suffering from #{@name}."
    @broadcastBuffMessage message

  uncast: (player) ->
    message = "#{player.name} is no longer suffering from #{@name}."
    @broadcast message

  constructor: (@game, @caster) ->
    super @game, @caster
    @bindings =
      doSpellCast: @cast
      doSpellUncast: @uncast
      "combat.self.turn.end": @tick

module.exports = exports = BluntHit