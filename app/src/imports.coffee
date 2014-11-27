@ledger =
      imports: [
        '../libs/jquery-2.1.1.min'
        '../libs/jquery.color'
        '../libs/underscore-min'
        '../libs/underscore.string.min'
        '../libs/underscore.inflection'
        '../libs/signals.min'
        '../libs/crossroads.min'
        '../libs/spin.min'
        '../libs/sjcl/sjcl'
        '../libs/sjcl/sha512'
        '../libs/jquery.selectric.min'
        '../libs/qrcode.min'
        '../public/tooltipster/js/jquery.tooltipster.min'
        '../libs/lw-api-js/lib/bitcoinjs-min'
        '../libs/lw-api-js/lib/util'
        '../libs/lw-api-js/lib/inheritance'
        '../libs/lw-api-js/lib/q'
        '../libs/lw-api-js/lib/async'
        '../libs/lw-api-js/lib/jsbn'
        '../libs/lw-api-js/lib/jsbn2'
        '../libs/lw-api-js/lib/BitcoinExternal'
        '../libs/lw-api-js/btchip-js-api/chromeApp/chromeDevice'
        '../libs/lw-api-js/btchip-js-api/GlobalConstants'
        '../libs/lw-api-js/btchip-js-api/Convert'
        '../libs/lw-api-js/btchip-js-api/ByteString'
        '../libs/lw-api-js/btchip-js-api/Card'
        '../libs/lw-api-js/btchip-js-api/CardTerminalFactory'
        '../libs/lw-api-js/btchip-js-api/CardTerminal'
        '../libs/lw-api-js/btchip-js-api/chromeApp/ChromeapiPlugupCard'
        '../libs/lw-api-js/btchip-js-api/chromeApp/ChromeapiPlugupCardTerminalFactory'
        '../libs/lw-api-js/btchip-js-api/ChromeapiPlugupCardTerminal'
        '../libs/lw-api-js/btchip-js-api/BTChip'
        '../libs/lw-api-js/ucrypt/JSUCrypt'
        '../libs/lw-api-js/ucrypt/keys'
        '../libs/lw-api-js/ucrypt/helpers'
        '../libs/lw-api-js/ucrypt/signature'
        '../libs/lw-api-js/ucrypt/ecfp'
        '../libs/lw-api-js/ucrypt/ecdsa'
        '../libs/lw-api-js/ucrypt/hash'
        '../libs/lw-api-js/ucrypt/sha256'
        '../libs/lw-api-js/ucrypt/sha512'
        '../libs/lw-api-js/ucrypt/hmac'
        '../libs/lw-api-js/LWTools'
        '../libs/lw-api-js/LW'
        '../libs/lw-api-js/LWWallet'
        '../libs/lw-api-js/LWTransaction'
        '../libs/bs58'
        '../libs/BigInt'
        '../libs/sha256'
        '../libs/checkBitcoinAddress'
        '../libs/lru'
        '../libs/moment.min'

        'routes'

        'utils/log'
        'utils/string'
        'utils/number'
        'utils/array'
        'utils/object'
        'utils/async'
        'utils/render'
        'utils/event_emitter'
        'utils/http_client'
        'utils/url'
        'utils/easing'
        'utils/router'
        'utils/i18n'
        'utils/jquery'
        'utils/spinners'
        'utils/pin_codes'
        'utils/lru'
        'utils/formatters'

        'utils/crypto/aes'
        'utils/crypto/sha256'
        'utils/crypto/base58'

        # SQLite
        'utils/sqlite/sqlite'

        'utils/bitcoin/bitcoin'
        'utils/bitcoin/bip39_wordlist'
        'utils/bitcoin/bip39'

        'utils/storage/store'
        'utils/storage/chrome_store'
        'utils/storage/secure_store'
        'utils/storage/synced_store'
        'utils/storage/object_store'
        'utils/storage/storage'

        'base/errors'

        'managers/devices_manager'

        ## Rest clients
        'restclients/restclient'
        'restclients/unspent_outputs_restclient'
        'restclients/transactions_restclient'
        'restclients/balance_restclient'

        ## Tasks
        'tasks/task'
        'tasks/balance_task'
        'tasks/wallet_layout_recovery_task'
        'tasks/transaction_observer_task'
        'tasks/operations_synchronization_task'

        ## Wallet
        'managers/wallets_manager'
        'wallet/hardware_wallet'
        'wallet/utils'
        'wallet/transaction'
        'wallet/value'
        'wallet/hdwallet'
        'wallet/cache'

        'base/model'
        'base/collection'
        'base/view_controller'
        'base/navigation_controller'

        ## Collections (must absolutely be imported here before models)

        ## Models
        'models/wallet'
        'models/account'
        'models/operation'

        ## Dialog Management
        'utils/dialogs'
        '../views/base/dialog'
        'base/dialog_view_controller'

        ## Common controllers
        # Dialogs
        'controllers/common/dialogs/common_dialogs_confirmation_dialog_view_controller'

        ## Wallet controllers
        'controllers/wallet/wallet_navigation_controller'

        # Dashboard
        'controllers/wallet/dashboard/wallet_dashboard_index_view_controller'

        # Operations
        'controllers/wallet/operations/wallet_operations_detail_dialog_view_controller'
        'controllers/wallet/operations/wallet_operations_index_view_controller'

        # Accounts
        'controllers/wallet/accounts/wallet_accounts_show_view_controller'

        # Send
        'controllers/wallet/send/wallet_send_index_dialog_view_controller'
        'controllers/wallet/send/wallet_send_validation_dialog_view_controller'
        'controllers/wallet/send/wallet_send_processing_dialog_view_controller'
        'controllers/wallet/send/wallet_send_preparing_dialog_view_controller'
        'controllers/wallet/send/wallet_send_error_dialog_view_controller'
        'controllers/wallet/send/wallet_send_success_dialog_view_controller'

        # Receive
        'controllers/wallet/receive/wallet_receive_index_dialog_view_controller'

        ## Onboarding controllers
        'controllers/onboarding/onboarding_view_controller'
        'controllers/onboarding/onboarding_navigation_controller'

        # Device
        'controllers/onboarding/device/onboarding_device_plug_view_controller'
        'controllers/onboarding/device/onboarding_device_unplug_view_controller'
        'controllers/onboarding/device/onboarding_device_pin_view_controller'
        'controllers/onboarding/device/onboarding_device_frozen_view_controller'
        'controllers/onboarding/device/onboarding_device_wrongpin_view_controller'
        'controllers/onboarding/device/onboarding_device_opening_view_controller'

        # Management
        'controllers/onboarding/management/onboarding_management_security_view_controller'
        'controllers/onboarding/management/onboarding_management_welcome_view_controller'
        'controllers/onboarding/management/onboarding_management_pin_view_controller'
        'controllers/onboarding/management/onboarding_management_pin_confirmation_view_controller'
        'controllers/onboarding/management/onboarding_management_seed_view_controller'
        'controllers/onboarding/management/onboarding_management_summary_view_controller'
        'controllers/onboarding/management/onboarding_management_provisioning_view_controller'
        'controllers/onboarding/management/onboarding_management_done_view_controller'
      ]