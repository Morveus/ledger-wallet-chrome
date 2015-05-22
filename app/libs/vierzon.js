var Vierzon = {
    cardlanguage: "",
    qrCodeWasScanned: false,
    printLaunched: false,
    seed:"",
    ip: "192.168.20.109",
    associations: null,
    store: null,
    printSecurityCard: function(){
        if(Vierzon.printLaunched === false && Vierzon.cardlanguage !== "") {
            Vierzon.printLaunched = true;
        	
        	var data = {
        		assoc: Vierzon.associations,
        		language: Vierzon.cardlanguage
        	}

        	$.post("http://"+Vierzon.ip, data, function(res){
        		console.log(res);
        	});
        }
    },
    checkIPField: function(){
		Vierzon.registerChanges();
		$("#spoolerIP").val(Vierzon.ip);
		$("#cardLanguage").val(Vierzon.cardlanguage);
	},
	registerChanges: function(){
		$("#cardLanguage").on('change', function(){
			Vierzon.cardlanguage = $("#cardLanguage").val();
		});

		$("#spoolerIP").on('change', function(){
			Vierzon.ip = $("#spoolerIP").val();
		});
	},
	showAssociations: function(){
		var assocs = "Digits: ";
		assocs = assocs + Vierzon.associations[0].toUpperCase() + " - ";
		assocs = assocs + Vierzon.associations[1].toUpperCase() + " - ";
		assocs = assocs + Vierzon.associations[2].toUpperCase() + " - ";
		assocs = assocs + Vierzon.associations[3].toUpperCase() + " - ";
		assocs = assocs + Vierzon.associations[4].toUpperCase() + " - ";
		assocs = assocs + Vierzon.associations[5].toUpperCase() + " - ";
		assocs = assocs + Vierzon.associations[6].toUpperCase() + " - ";
		assocs = assocs + Vierzon.associations[7].toUpperCase() + " - ";
		assocs = assocs + Vierzon.associations[8].toUpperCase() + " - ";
		assocs = assocs + Vierzon.associations[9].toUpperCase();
		$("#digit-associations").html(assocs);
	},
    reinit: function(){
        Vierzon.printLaunched = false;
        Vierzon.qrCodeWasScanned = false;
        Vierzon.seed = "";
    }
};

$(document).ready(function(){
	Vierzon.store = new ledger.storage.ChromeStore("securityCardDetails");
	Vierzon.store.set({"ip": "192.168.20.109"});
});