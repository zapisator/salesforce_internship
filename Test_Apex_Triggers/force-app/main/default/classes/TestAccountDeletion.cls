// @isTest
// private class TestAccountDeletion {
//     @isTest static void TestDeleteAccountWithOneOpportunity() {
//         // Test data setup
//         // Create an account with an opportunity, and then try to delete it
//         Account acct = new Account(Name='Test Account');
//         insert acct;
//         Opportunity opp = new Opportunity(Name=acct.Name + ' Opportunity',
//                                        StageName='Prospecting',
//                                        CloseDate=System.today().addMonths(1),
//                                        AccountId=acct.Id);
//         insert opp;
        
//         // Perform test
//         Test.startTest();
//         Database.DeleteResult result = Database.delete(acct, false);
//         Test.stopTest();
//         // Verify 
//         // In this case the deletion should have been stopped by the trigger,
//         // so verify that we got back an error.
//         System.assert(!result.isSuccess());
//         System.assert(result.getErrors().size() > 0);
//         System.assertEquals('Cannot delete account with related opportunities.',
//                              result.getErrors()[0].getMessage());
//     }
    
// }

@isTest
private with sharing class TestAccountDeletion
{
	@isTest
	static void TestDeleteAccountWithOneOpportunity() 
	{
		Account					acct;
		Opportunity				opp;
		Database.DeleteResult 	result;

		/*
		** Test data setup
		** Create an account with an opportunity, and then try to delete it
		*/
		acct = new Account(
			Name		=	'Test Account');
		insert acct;
		opp = new Opportunity(
			Name		=	acct.Name + ' Opportunity',
			StageName	=	'Prospecting',
			CloseDate	=	System.today().addMonths(1),
			AccountId	=	acct.Id);
		insert opp;
		/*
		** Perform test
		*/
		Test.startTest();
		result = Database.delete(acct, false);
		Test.stopTest();
		/*
		** Verify 
		** In this case the deletion should have been stopped by the trigger,
		** so verify that we got back an error.
		*/
		System.assert(result.isSuccess() == false);
		System.assert(result.getErrors().size() > 0);
		System.assertEquals('Cannot delete account with related opportunities.',
			result.getErrors()[0].getMessage());
	}
	
}