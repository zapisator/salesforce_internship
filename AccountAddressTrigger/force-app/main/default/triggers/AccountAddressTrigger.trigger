trigger AccountAddressTrigger on Account (before insert, before update) {
	
	Account acc = Trigger.new[0];
	if (acc.BillingPostalCode != null && acc.Match_Billing_Address__c == true) {
		acc.ShippingPostalCode = acc.BillingPostalCode;
	}
}