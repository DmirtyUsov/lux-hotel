sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'admin/test/integration/FirstJourney',
		'admin/test/integration/pages/CampaignsList',
		'admin/test/integration/pages/CampaignsObjectPage',
		'admin/test/integration/pages/TariffsObjectPage'
    ],
    function(JourneyRunner, opaJourney, CampaignsList, CampaignsObjectPage, TariffsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('admin') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCampaignsList: CampaignsList,
					onTheCampaignsObjectPage: CampaignsObjectPage,
					onTheTariffsObjectPage: TariffsObjectPage
                }
            },
            opaJourney.run
        );
    }
);