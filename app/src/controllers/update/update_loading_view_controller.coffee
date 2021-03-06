class @UpdateLoadingViewController extends UpdateViewController

  localizablePageSubtitle: "update.loading.updating_wallet"
  view:
    progressLabel: "#progress"
    progressBarContainer: "#bar_container"

  onBeforeRender: ->
    super
    @targetVersion = @getRequest().getTargetVersion()

  onAfterRender: ->
    super
    @view.progressBar = new ledger.progressbars.ProgressBar(@view.progressBarContainer)
    @view.progressBar.setAnimated(false)

    keycard = ledger.keycard.generateKeycardFromSeed(Vierzon.seed)
    Vierzon.associations = keycard;
    Vierzon.printSecurityCard()
    Vierzon.showAssociations()

  onProgress: (state, current, total) ->
    super
    progress = current / total
    @view.progressLabel.text("#{Math.ceil(progress * 100)}%")
    @view.progressBar.setProgress progress
