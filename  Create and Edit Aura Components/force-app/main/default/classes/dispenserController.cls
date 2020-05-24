public with sharing class dispenserController
{

	@AuraEnabled
	public static Dispenser_account__c getAccount(String cardNumber, String PIN)
	{
		List <Dispenser_account__c>			accounts;

		System.debug('cardNumber ' + cardNumber + 'PIN' + PIN);
		accounts =
		[
			SELECT Id, Name, Is_credit_card__c, maximum_loan_amount__c,
				Bank_owner__c, Balance__c, Currency_type__c, Withdraw__c
			FROM Dispenser_account__c
			WHERE
				(Dispenser_account__c.Card_number__c = :cardNumber) AND
				(Dispenser_account__c.PIN__c = :PIN)
		];
		System.debug('accounts[0]' + accounts[0]);
		return (accounts[0]);
	}

	@AuraEnabled
	public static Dispenser_account__c saveAccount(Dispenser_account__c account)
	{
		/*
		** Perform isUpdateable() checking first, then
		*/
		upsert account;
		return (account);
	}

}

// dispenserController.getAccount('1000000001', '1001');
