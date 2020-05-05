@isTest
private class Catalog_Controller_Test {
    static testMethod void runTest() {
        /* Begin initialization and inserts */
        System.debug('DEBUG TEST: Test Beginning...');
        Product2 tp = new Product2();
        tp.Name = 'TestProduct';
        tp.Default_Price__c = 1.00;
        tp.Family = 'TestFamily';

        Account acct = new Account();
        acct.Name = 'a';

        Catalog_Order__c tOrder = new Catalog_Order__c();
        Catalog_Line_Item__c tLi = new Catalog_Line_Item__c();

        Document tDoc = new Document();

        Folder[] tFolder = [SELECT Id FROM Folder WHERE Type = 'Document' AND AccessType = 'Public' LIMIT 1];
        if(tFolder.size() > 0) {
			tDoc = new Document();
	 		tDoc.FolderId = tFolder[0].Id;
			tDoc.Name = 'Catalog_BG';
		} else {
			tDoc = [SELECT Id,FolderId FROM Document LIMIT 1];
		}

       
        System.debug('DEBUG TEST: About to begin Test inserts...');
        Test.startTest();
        insert tp;
        insert acct;

        tLi.Product__c = tp.Id;
        tLi.Quantity__c = 1;
        System.debug('DEBUG TEST: objects inserted.');
        
        /* Testing Brander Methods */
        System.debug('DEBUG TEST BRANDER: About to begin Test inserts...');
        PageReference pageRef = Page.Catalog_Cart;
        Test.setCurrentPage(pageRef);
        System.debug('DEBUG TEST BRANDER: Building controller 1...');
        CatalogConfiguration b_controller = new CatalogConfiguration();
        System.debug('DEBUG TEST BRANDER: calling saveTemplate()...');
        b_controller.saveTemplate();
        System.debug('DEBUG TEST BRANDER: Building controller 2...');
        CatalogConfiguration b_controller2 = new CatalogConfiguration();
        System.debug('DEBUG TEST BRANDER: calling saveFile() 1...');
        b_controller2.saveFile();

        System.debug('DEBUG TEST BRANDER: buidling Blob...');
        String myString = 'StringToBlob';
    	Blob bTest = Blob.valueOf(myString);

    	tDoc.Body = bTest;
    	insert tDoc;

        b_controller2.b = bTest;
        b_controller2.bSize = 1;
        System.debug('DEBUG TEST BRANDER: calling saveFile() 2...');
        b_controller2.saveFile();

        System.debug('DEBUG TEST BRANDER: Controller created and given context');

        /* Handle the building of controllers */
        pageRef = Page.Catalog_Cart;
        Test.setCurrentPage(pageRef);
        System.debug('DEBUG TEST: Test current page set');
        
        Catalog_Controller controller = new Catalog_Controller();
        System.debug('DEBUG TEST: Controller created and given context');

        /* start calling methods to test */
        System.debug('DEBUG TEST: Beginning method calls...');

        System.debug('DEBUG TEST: Rerunning prepareCart with valid Order in system...');
        insert tOrder;
        tLi.Catalog_Order__c = tOrder.Id;
        insert tLi;
        controller.prepareCart();
        System.debug('DEBUG TEST: prepareCart() Complete.');

        System.debug('DEBUG TEST: addToCart() with no productId.');
        controller.addToCart();
        System.debug('DEBUG TEST: addToCart() with productId.');
        controller.productId = tp.Id;
        controller.addToCart();
        System.debug('DEBUG TEST: addToCart() with duplicate productId.');
        controller.productId = tp.Id;
        controller.addToCart();
        System.debug('DEBUG TEST: addToCart() Complete.');
        
        System.debug('DEBUG TEST: updateQuantity().');
        controller.productId = tLi.Id;
        controller.productQuantity = 2;
        controller.updateQuantity();
        System.debug('DEBUG TEST: updateQuantity() Complete.');
        
        System.debug('DEBUG TEST: deleteFromCart() with no productId.');
        controller.productId = null;
        controller.deleteFromCart();
        System.debug('DEBUG TEST: deleteFromCart() with productId.');
        controller.productId = tli.Id;
        controller.deleteFromCart();
        System.debug('DEBUG TEST: deleteFromCart() Complete.');
        
        System.debug('DEBUG TEST: updateAccount().');
        controller.accountId = acct.Id;
        controller.updateAccount();
        System.assertEquals(acct.Id,controller.myOrder.Account__c);
        System.debug('DEBUG TEST: updateAccount() Complete.');
        
        System.debug('DEBUG TEST: getProduct().');
        controller.getProduct(tp.Id);
        System.debug('DEBUG TEST: getProduct() Complete.');
        
        System.debug('DEBUG TEST: clearOrder().');
        controller.clearOrder();
        System.debug('DEBUG TEST: clearOrder() Complete.');
        
        System.debug('DEBUG TEST: completeOrder().');
        controller.completeOrder();
        System.debug('DEBUG TEST: completeOrder() Complete.');
        
        System.debug('DEBUG TEST: toCart().');
        controller.toCart();
        System.debug('DEBUG TEST: toCart() Complete.');
        
        System.debug('DEBUG TEST: toCatalog().');
        controller.toCatalog();
        System.debug('DEBUG TEST: toCatalog() Complete.');

        /* Testing Lookup Methods */
        System.debug('DEBUG TEST: PopulateValues() with no filter.');
        controller.PopulateValues();
        System.debug('DEBUG TEST: PopulateValues() with a filter.');
        controller.filter = 'a';
        controller.PopulateValues();
        System.debug('DEBUG TEST: PopulateValues() Complete.');

        Test.stopTest();
        System.debug('DEBUG TEST: Test complete.');
    }
}