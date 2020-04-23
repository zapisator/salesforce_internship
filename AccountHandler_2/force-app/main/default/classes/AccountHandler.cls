public class	AccountHandler {

	// 	List<Account> addAccounts = new List<Account>();
	public static void	insertAccount(Integer accountNumber) {
		Integer				i;
		List<Account>		addAccounts;
		Account				currAcc;

		i = 0;
		addAccounts = new List<Account>();
		while (i < 3)
		{
			currAcc = new Account(Name = 'Acme Inc ' + accountNumber,
				AccountNumber = 'A000' + accountNumber);
			addAccounts.add(currAcc);
			accountNumber++;
			i++;
		}
		insert addAccounts;
		return;
	}
}
