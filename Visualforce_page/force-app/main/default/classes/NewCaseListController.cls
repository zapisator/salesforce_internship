public with sharing class NewCaseListController
{

	public List <Case> getNewCases()
	{
		List <Case>		cases;

		cases = [
			SELECT Id, CaseNumber
			FROM Case
			WHERE status = 'New'
		];
		return (cases);
    }

}
