public with sharing class ExpensesController
{

	@AuraEnabled
	public static List <Expense__c> getExpenses()
	{
		List <Expense__c>					expenses;
		String[]							fieldsToCheck;
		Map <String, Schema.SObjectField>	fieldDescribeTokens;

		/*
		** Check to make sure all fields are accessible to this user
		*/
		fieldsToCheck = new String[]
		{
			'Id', 'Name', 'Amount__c', 'Client__c', 'Date__c', 'Reimbursed__c',
				'CreatedDate'
		};
		fieldDescribeTokens = Schema.SObjectType.Expense__c.fields.getMap();
		for (String field : fieldsToCheck)
			if (!fieldDescribeTokens.get(field).getDescribe().isAccessible())
				throw new System.NoAccessException();

		/*
		** Get value from Database.
		*/
		expenses =
		[
			SELECT Id, Name, Amount__c, Client__c, Date__c, Reimbursed__c,
				CreatedDate 
			FROM Expense__c
		];
		return (expenses);
	}

	@AuraEnabled
	public static Expense__c saveExpense(Expense__c expense)
	{
		/*
		** Perform isUpdateable() checking first, then
		*/
		upsert expense;
		return (expense);
	}

}
