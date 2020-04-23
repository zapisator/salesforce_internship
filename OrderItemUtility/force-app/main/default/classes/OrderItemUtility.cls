public class OrderItemUtility
{

	public static void addBonusBouquet(List <Order> ordersFromTrigger)
	{
		List <OrderItem>		newBouquets;
		List <Product2>			bonusProductList;
		Product2				bonusProduct;
		List <PricebookEntry>	entryList;
		PricebookEntry			entry;
		OrderItem				freeBouquet;

		newBouquets = new List<OrderItem>();
		bonusProductList =
		[
			SELECT	ID, ProductCode
			FROM	Product2
			WHERE	ProductCode		=	'BOT-BB-12'
		];
		bonusProduct = new Product2();
		if (bonusProductList.size() > 0)
			bonusProduct = bonusProductList[0];
		entryList =
		[
			SELECT	ID, Product2Id
			FROM	PricebookEntry
			WHERE	Product2Id		=	:bonusProduct.Id
		];
		entry = new PricebookEntry();
		if (entryList.size() > 0)
			entry = entryList[0];
		for (Order currentOrder : ordersFromTrigger)
		{
			if (currentOrder.Status == 'Activated')
			{
				freeBouquet = new OrderItem
				(
					OrderId					= currentOrder.id, 
					PricebookEntryId		= entry.id,
					numberOfFlowers__c		= 3,
					description				= 'FREE Bouquet',
					Quantity				= 1,
					colorTheme__c			= 'Spectacular Sunset',
					percentOfOpening__c		= 0,
					UnitPrice				= 0.00
				);
			newBouquets.add(freeBouquet);
			}
		}
		insert newBouquets;
		return;
	}
}
