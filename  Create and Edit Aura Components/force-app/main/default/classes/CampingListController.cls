public with sharing class CampingListController
{
	// public class CampingListController {

	// 	@auraenabled
	// 	public static List<Camping_Item__c> getItems (){
	// 		List<Camping_Item__c> CI = [select id, name,price__c,Quantity__c,Packed__c from Camping_Item__c ];
	// 		return CI;
	// 	}

	// 	@auraenabled
	// 	public static Camping_Item__c saveItem (Camping_Item__c item){
	// 		insert item;
	// 		return item;
	// 	}
	// }

	@AuraEnabled
	public static List <Camping_Item__c> getItems()
	{
		List <Camping_Item__c>				items;
		String[]							fieldsToCheck;
		Map <String, Schema.SObjectField>	fieldDescribeTokens;

		/*
		** Check to make sure all fields are accessible to this user
		*/
		fieldsToCheck = new String[]
		{
			'Id', 'Name', 'Quantity__c', 'Price__c', 'Packed__c'
		};
		fieldDescribeTokens = Schema.SObjectType.Camping_Item__c.fields.getMap();
		for (String field : fieldsToCheck)
			if (!fieldDescribeTokens.get(field).getDescribe().isAccessible())
				throw new System.NoAccessException();

		/*
		** Get value from Database.
		*/
		items =
		[
			SELECT Id, Name, Quantity__c, Price__c, Packed__c
			FROM Camping_Item__c
		];
		return (items);
	}

	@AuraEnabled
	public static Camping_Item__c saveItem(Camping_Item__c item)
	{
		/*
		** Perform isUpdateable() checking first, then
		*/
		upsert item;
		return (item);
	}

}
