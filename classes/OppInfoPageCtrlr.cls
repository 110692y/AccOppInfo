public with sharing class OppInfoPageCtrlr {
    public Account acc {get;set;}

    public Account callAccount() {
        Set<Id> currentOppId = new Set<Id>();
        currentOppId.add(ApexPages.currentPage().getParameters().get('id'));
        Opportunity oppItem = [select id, AccountId from Opportunity where id in: currentOppId limit 1];
        acc = [select id, Name from Account where id=:oppItem.AccountId];
        return acc;
    }
        public OppInfoPageCtrlr(ApexPages.StandardController controller) {
            acc = callAccount();
        }
}

//        oppId.add(controller.getRecord().id);
