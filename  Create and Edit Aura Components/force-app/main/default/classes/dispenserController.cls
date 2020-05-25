public with sharing class dispenserController
{

	@AuraEnabled
	public static Dispenser_account__c getAccount(
		String								cardNumber,
		String								PIN)
	{
		List <Dispenser_account__c>			accounts;

		System.debug('cardNumber: |' + cardNumber + 'PIN' + PIN + '|');
		accounts =
		[
			SELECT Id, Name, Is_credit_card__c, maximum_loan_amount__c,
				Bank_owner__c, Balance__c, Currency_type__c, Withdraw__c
			FROM Dispenser_account__c
			WHERE
				(Dispenser_account__c.Card_number__c = :cardNumber) AND
				(Dispenser_account__c.PIN__c = :PIN)
		];
		System.debug('accounts[0]: |' + accounts[0] + '|');
		return (accounts[0]);
	}

	@AuraEnabled
	public static Dispenser_bank__c getBank(
		String								bankName)
	{
		List <Dispenser_bank__c>			bankDataList;
		Dispenser_bank__c					bankData;

		System.debug('bankData: |' + bankData + '|');
		bankDataList =
		[
			SELECT Id, Name,
				Balance_interest__c, Transfer_commision__c,
				BYN_exchange_rate__c, USD_exchange_rate__c
			FROM Dispenser_bank__c
			WHERE Dispenser_bank__c.Name = :bankName
		];
		bankData = bankDataList[0];
		System.debug('bankData: |' + bankData + '|');
		return (bankData);
	}

	@AuraEnabled
	public static Dispenser_terminal__c getTerminal(
		String								terminalBankId)
	{
		List <Dispenser_terminal__c>		terminalDataList;
		Dispenser_terminal__c				terminalData;

		System.debug('terminalData: |' + terminalData + '|');
		System.debug('terminalData: |' + terminalBankId + '|');
		terminalDataList =
		[
			SELECT Id, Name,
				ATM_BYN_cash__c, ATM_RUB_cash__c, ATM_USD_cash__c,
				Dispenser_bank__c
			FROM Dispenser_terminal__c
			WHERE Dispenser_terminal__c.Dispenser_bank__c = :terminalBankId
		];
		terminalData = terminalDataList[0];
		System.debug('terminalData: |' + terminalData + '|');
		return (terminalData);
	}

	@AuraEnabled
	public static Dispenser_account__c updateAccount(Dispenser_account__c account)
	{
		/*
		** Perform isUpdateable() checking first, then
		*/
		upsert account;
		return (account);
	}

}

// dispenserController.getAccount('1000000001', '1001', 'Bank_01');
// dispenserController.getTerminal('a0H5I000002PimDUAS');

