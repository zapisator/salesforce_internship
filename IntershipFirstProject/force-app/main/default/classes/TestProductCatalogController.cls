/**
 * Created by nick.edises on 9/29/16.
 */

@isTest
private class TestProductCatalogController {
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

        ProductCatalogController controller = new ProductCatalogController();
        System.debug('DEBUG TEST: Controller created and given context');

        /* start calling methods to test */
        System.debug('DEBUG TEST: Beginning method calls...');

        Product2[] products = ProductCatalogController.getProducts();
        System.debug('DEBUG TEST: getProducts() Complete.');

        Account[] accounts = ProductCatalogController.getAccounts();
        System.debug('DEBUG TEST: getAccounts() Complete.');

        System.debug('DEBUG TEST: preparing to run createCatalogOrder with Account and OrderItem list...');
        List<Catalog_Line_Item__c> orderItems = new List<Catalog_Line_Item__c> ();
        Catalog_Line_Item__c item = new Catalog_Line_Item__c();
        item.Product__c = tp.Id;
        item.Quantity__c = 1;
        orderItems.add(item);
        ProductCatalogController.createCatalogOrder(acct.Id, orderItems);
        System.debug('DEBUG TEST: createCatalogOrder() Complete.');


        Profile p = [select Id, Name from Profile where Name = 'Read Only'];
        User readOnlyUser = new User(
                UserName = 'test-user@test-company.com',
                FirstName = 'Test-First-Name',
                LastName = 'Test-Last-Name',
                Alias = 'test',
                Email = 'test-user@test-company.com',
                EmailEncodingKey = 'UTF-8',
                LanguageLocaleKey = 'en_US',
                LocalesIdKey = 'en_US',
                TimezonesIdKey = 'America/Los_Angeles',
                ProfileId = p.Id
        );
        insert readOnlyUser;
        System.runAs(readOnlyUser) {
            try{ProductCatalogController.createCatalogOrder(acct.Id, orderItems);
            } catch (exception e){}

        }

        Test.stopTest();
        System.debug('DEBUG TEST: Test complete.');
    }
}