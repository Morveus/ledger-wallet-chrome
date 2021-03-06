
class @Operation extends ledger.database.Model
  do @init

  @index 'uid'

  @pendingRawTransactionStream: () ->
    @_pendingRawTransactionStream ?= new Stream().open()
    @_pendingRawTransactionStream

  serialize: () ->
    json = super
    delete json['uid']
    return json

  get: (key) ->
    switch key
      when 'total_value'
        if super('type') == 'sending'
          ledger.Amount.fromSatoshi(super 'value').add(super 'fees')
        else
          super 'value'
      else super key