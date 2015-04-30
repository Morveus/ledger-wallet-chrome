class @UpdateDoneViewController extends @UpdateViewController

  localizablePageSubtitle: "update.done.update_succeeded"
  localizableNextButton: "common.restore"
  navigation:
    nextRoute: "/onboarding/management/welcome"

  onAfterRender: ->
    super
    Vierzon.reinit()

  navigateNext: ->
    ledger.app.setExecutionMode(ledger.app.Modes.Wallet)
    super