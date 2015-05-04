class @UpdateCardcheckViewController extends UpdateViewController

  localizablePageSubtitle: "update.cardcheck.security_card_check"
  localizablePreviousButton: "common.back"
  localizableNextButton: "common.restore"
  navigation:
    nextRoute: "/onboarding/management/welcome"
    previousRoute: "/update/done"
  view:
    value1: "#value1"
    value2: "#value2"
    value3: "#value3"
    value4: "#value4"
    value5: "#value5"
    value6: "#value6"
    value7: "#value7"
    value8: "#value8"
    value9: "#value9"
    value10: "#value10"

  onAfterRender: ->
    super
    Vierzon.reinit()
    @_generateCharacters()

  _generateCharacters: ->
    return if not @params?.seed?
    keycard = ledger.keycard.generateKeycardFromSeed(@params.seed)
    @view.value1.text keycard['0'].toUpperCase()
    @view.value2.text keycard['1'].toUpperCase()
    @view.value3.text keycard['2'].toUpperCase()
    @view.value4.text keycard['3'].toUpperCase()
    @view.value5.text keycard['4'].toUpperCase()
    @view.value6.text keycard['5'].toUpperCase()
    @view.value7.text keycard['6'].toUpperCase()
    @view.value8.text keycard['7'].toUpperCase()
    @view.value9.text keycard['8'].toUpperCase()
    @view.value10.text keycard['9'].toUpperCase()
