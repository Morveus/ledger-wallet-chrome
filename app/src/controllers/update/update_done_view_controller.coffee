class @UpdateDoneViewController extends @UpdateViewController

  localizablePageSubtitle: "update.done.update_succeeded"
  localizableNextButton: "common.continue"
  navigation:
    nextRoute: "/update/cardcheck"

  navigateNext: ->
    @navigation.nextParams = {seed: Vierzon.seed}
    ledger.app.setExecutionMode(ledger.app.Modes.Wallet)
    super