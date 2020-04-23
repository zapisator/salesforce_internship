@isTest
public with sharing class TestDataFactory
{
	public static List <Account> createAccountsWithOpps(
		Integer				numAccts,
		Integer				numOppsPerAcct)
		{
		List <Account>		accts;
		Account				acct;
		Account				a;
		Integer				i;
		Integer				j;
		Integer				k;
		List <Opportunity>	opps;
		Opportunity			opp;
		
		accts = new List<Account>();
		
		for(i = 0;  i < numAccts; i++)
		{
			a = new Account(
				Name			= 'TestAccount' + i);
			accts.add(a);
		}
		insert accts;
		
		opps = new List<Opportunity>();
		for (j = 0; j < numAccts; j++)
		{
			acct = accts[j];
			/*
			** For each account just inserted, add opportunities
			*/
			for (k = 0; k < numOppsPerAcct; k++)
			{
				opp = new Opportunity(
					Name		= acct.Name + ' Opportunity ' + k,
					StageName	= 'Prospecting',
					CloseDate	= System.today().addMonths(1),
					AccountId	= acct.Id);
				opps.add(opp);
			}
		}
		/*
		** Insert all opportunities for all accounts.
		*/
		insert opps;
		
		return (accts);
	}
}