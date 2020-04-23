public with sharing class RandomContactFactory
{

	public static List <Contact> generateRandomContacts(
		Integer				nbContacts,
		String				lastName)
	{
		List <Contact>		contactList;
		Contact				currContact;
		Integer				firstNamePostfix;

		System.assert(nbContacts > 0 && lastName != null);
		firstNamePostfix = 1;
		contactList = new List <Contact>();

		for (; nbContacts > 0; nbContacts--)
		{
			currContact = new Contact(
				FirstName	= 'Test ' + firstNamePostfix++,
				LastName	= lastName
			);
			contactList.add(currContact);
		}
		System.assert(contactList.size() > 0);
		return (contactList);
	}
}
