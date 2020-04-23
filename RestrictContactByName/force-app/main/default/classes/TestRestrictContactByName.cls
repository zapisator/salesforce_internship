@isTest
private with sharing class TestRestrictContactByName
{
	static final Integer	FIRST_OF_ARRAY;

	@isTest
	static void TestRestrictContactByName()
	{
		Contact				contactObj;
		Database.SaveResult	result;

		contactObj = new Contact();
		insertInvalid(contactObj, result);
		assertResult(contactObj, result);
		insertValid(contactObj);
		updateInvalid(contactObj, result);
		assertResult(contactObj, result);
	}

	static private void assertResult(
		Contact				contactObj,
		Database.SaveResult	result)
	{
		System.assert(result.isSuccess() == false);
		System.assertEquals(
			'The Last Name "' +
				contactObj.LastName +
				'" is not allowed for DML',
			result.getErrors()[FIRST_OF_ARRAY].getMessage());
	}

	static private void insertInvalid(
		Contact				contactObj,
		Database.SaveResult	result)
	{
		contactObj.LastName = 'INVALIDNAME';
		Test.startTest();
		result = Database.insert(contactObj, false);
		Test.stopTest();
	}

	static private void insertValid(Contact contactObj)
	{
		Test.startTest();
		contactObj.LastName = 'VALIDNAME';
		Database.insert(contactObj, true);
		Test.stopTest();
	}

	static private void updateInvalid(
		Contact				contactObj,
		Database.SaveResult	result)
	{
		Test.startTest();
		contactObj.LastName = 'INVALIDNAME';
		result = Database.update(contactObj, false);
		Test.stopTest();
	}

}
