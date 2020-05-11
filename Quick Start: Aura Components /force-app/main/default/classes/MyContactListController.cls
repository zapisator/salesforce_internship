public with sharing class MyContactListController
{

	@AuraEnabled
	public static List<Contact> getContacts(Id recordId)
	{
		List <Contact>		contactList;

		contactList =
		[
			SELECT	Id, FirstName, LastName, Email, Phone From Contact 
			WHERE AccountId = :recordId
		];
		return (contactList);
	}
}
