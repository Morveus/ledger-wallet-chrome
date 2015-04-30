class @UpdateSeedViewController extends UpdateViewController

  localizablePageSubtitle: "update.seed.security_card_qrcode"
  navigation:
    nextRoute: "/update/cardcheck"
    previousRoute: "/onboarding/device/plug"
    previousParams: {animateIntro: no}
  view:
    seedInput: "#seed_input"
    validCheck: "#valid_check"
    openScannerButton: "#open_scanner_button"

  onAfterRender: ->
    super
    @_listenEvents()
    @view.seedInput.val @params.seed if @params?.seed?
    @_updateValidCheck()
    @showQRCodeReader()
    l(Vierzon.cardlanguage)

  navigatePrevious: ->
    ledger.app.setExecutionMode(ledger.app.Modes.Wallet)
    super

  navigateNext: ->
    @navigation.nextParams = {seed: @_seedInputvalue()}
    super

  shouldEnableNextButton: ->
    @_keychardValueIsValid @_seedInputvalue()

  _keychardValueIsValid: (value) =>
    return @getRequest().checkIfKeyCardSeedIsValid value

  _listenEvents: ->
    # force focus
    @view.seedInput.on 'blur', => @view.seedInput.focus()
    _.defer => @view.seedInput.focus()
    # listen input
    @view.seedInput.on 'input', =>
      @parentViewController.updateNavigationItems()
      @_updateValidCheck()
    @view.openScannerButton.on 'click', =>
      @showQRCodeReader()

  showQRCodeReader: ->
    dialog = new CommonDialogsQrcodeDialogViewController
    dialog.qrcodeCheckBlock = (data) =>
      return @_keychardValueIsValid data
    dialog.once 'qrcode', (event, data) =>
      @view.seedInput.val data
      @parentViewController.updateNavigationItems()
      @_updateValidCheck()
      Vierzon.qrCodeWasScanned = true
    dialog.show()

  _updateValidCheck: ->
    if @_keychardValueIsValid @view.seedInput.val()
      fullSeed = @view.seedInput.val()

      keyData     = ISO7064Mod97_10Check.getData(fullSeed)
      checkEncode = ISO7064Mod97_10Check.encode(keyData)

      if fullSeed == checkEncode
        @view.validCheck.show()
        @navigateNext()

    else @view.validCheck.hide()

  _seedInputvalue: ->
    _.str.trim @view.seedInput.val()