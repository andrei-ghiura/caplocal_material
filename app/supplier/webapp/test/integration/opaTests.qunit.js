sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/eudr/supplier/supplier/test/integration/FirstJourney',
		'com/eudr/supplier/supplier/test/integration/pages/SupplierList',
		'com/eudr/supplier/supplier/test/integration/pages/SupplierObjectPage',
		'com/eudr/supplier/supplier/test/integration/pages/MaterialsObjectPage'
    ],
    function(JourneyRunner, opaJourney, SupplierList, SupplierObjectPage, MaterialsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/eudr/supplier/supplier') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSupplierList: SupplierList,
					onTheSupplierObjectPage: SupplierObjectPage,
					onTheMaterialsObjectPage: MaterialsObjectPage
                }
            },
            opaJourney.run
        );
    }
);