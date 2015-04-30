class @UpdateIndexViewController extends @UpdateViewController

  navigation:
    nextRoute: "/update/seed"
    previousRoute: "/onboarding/device/plug"
    previousParams: {animateIntro: no}
  localizablePageSubtitle: "update.index.important_notice"

  onAfterRender: ->
    super
    @navigateNext() if not Vierzon.qrCodeWasScanned

  navigatePrevious: ->
    ledger.app.setExecutionMode(ledger.app.Modes.Wallet)
    super