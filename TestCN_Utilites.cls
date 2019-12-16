@isTest
public with sharing class TestCN_Utilites {
    @TestSetup
    static void makeData(){
        CN_DataFactory.createAccountList(5,true);
        CN_Project__c newProject = CN_DataFactory.createProject('New test project',true);
        CN_DataFactory.createProjectOrderList(5,newProject.Id,true);
        CN_DataFactory.createAssetList(10, true);
    }

    @isTest static void testGetObjectIconMap() {
        CN_Utilities.getObjectIconMap();
    }

    @isTest static void testGetData() {
        CN_Utilities.getData('Name', 'Account', null, null, true);
    }

    @isTest static void testGetRecordTypeId() {
        CN_Utilities.getRecordTypeId('Product2','Machine');
    }

    @isTest static void testGetRecordTypeMap() {
        CN_Utilities.getRecordTypeMap('Product2');
    }

    @isTest static void testGetDescribedObjects() {
        List<String> lstSObjectType = new List <String> {'Account'};
        CN_Utilities.getDescribedObjects(lstSObjectType);
    }

    @isTest static void testDeleteProjectOrdersByIDs() {
        List <CN_Project__c> projectList = [SELECT Id, Name FROM CN_Project__c LIMIT 3];
        List <Id> projectIdList = new List <Id> ();
        for(CN_Project__c project : projectList) {
            projectIdList.add(project.Id);
        }
        CN_Utilities.deleteProjectOrdersByIDs(projectIdList);
    }

    @isTest static void testUpdateContainerStatus() {
        List <Asset> assetList = [SELECT Id, Name FROM Asset LIMIT 10];
        Set <Id> assetsToAssign = new Set <Id> ();
        Set <Id> assetsToUnassign = new Set <Id> ();
        for(Integer i = 0; i < assetList.size(); i++) {
            if(math.mod(i,2) == 0) {
                assetsToAssign.add(assetList[i].Id);
            } else {
                assetsToUnassign.add(assetList[i].Id);
            }
        }
        CN_Utilities.updateContainerStatus(assetsToAssign, assetsToUnassign);
    }

    @isTest static void testGetProjectMapByIDs() {
        List <CN_Project__c> projectList = [SELECT Id, Name FROM CN_Project__c LIMIT 3];
        Set <Id> projectIds = new Set <Id> ();
        for(CN_Project__c project : projectList) {
            projectIds.add(project.Id);
        }
        CN_Utilities.getProjectMapByIDs(projectIds);
    }

    @isTest static void testGetProjectOrderMapByIDs() {
        List <CN_ProjectOrder__c> projectOrderList = [SELECT Id, Name FROM CN_ProjectOrder__c LIMIT 3];
        Set <Id> projectOrderIdsList = new Set <Id> ();
        for(CN_ProjectOrder__c projectOrder : projectOrderList) {
            projectOrderIdsList.add(projectOrder.Id);
        }
        CN_Utilities.getProjectOrderMapByIDs(projectOrderIdsList);
    }

    @isTest static void testGetProjectOrderEmailTemplates() {
        CN_Utilities.getProjectOrderEmailtemplates();
    }

    @isTest static void testCheckNullString() {
        CN_Utilities.checkNullStrings('some test string');
    }

    @isTest static void testGetPrimaryLocation() {
        CN_Project__c newProject = CN_DataFactory.createProject('Test project', true);
        CN_Location__c newLocation = CN_DataFactory.createLocation(newProject.Id, true);
        CN_Utilities.getPrimaryLocation(newProject.Id);
    }

    
    @isTest static void testCreateLocation() {
        CN_Utilities.PrimaryLocation loc = CN_DataFactory.createPrimaryLocation();
        CN_Utilities.createLocation(JSON.serialize(loc));
    }
}