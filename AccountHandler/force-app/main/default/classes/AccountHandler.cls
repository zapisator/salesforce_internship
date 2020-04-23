public class AccountHandler {
	
	public static Account insertNewAccount(String accountName) {
		Account freshOne = new Account(Name = accountName);
		try {
			insert freshOne;
		}
		catch (Exception e) {
			return null;
		}
		return freshOne;
	}
}
