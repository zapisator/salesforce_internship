// trigger AccountDeletion on Account (before delete) {
   
//     // Prevent the deletion of accounts if they have related opportunities.
//     for (Account a : [SELECT Id FROM Account
//                      WHERE Id IN (SELECT AccountId FROM Opportunity) AND
//                      Id IN :Trigger.old]) {
//         Trigger.oldMap.get(a.Id).addError(
//             'Cannot delete account with related opportunities.');
//     }
    
// }

trigger AccountDeletion on Account (before delete)
{
	List <Account>	accountList;
	/*
	** Prevent the deletion of accounts if they have related opportunities.
	*/
	accountList =
	[
		SELECT Id
		FROM Account
		WHERE Id IN 
		(
			SELECT AccountId 
			FROM Opportunity
		)
			AND Id IN :Trigger.old
	];
	for (Account a : accountList)
		Trigger.oldMap.get(a.Id).addError(
			'Cannot delete account with related opportunities.');
}