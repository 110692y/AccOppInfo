public class Actrlr {

    public List<SelectOption> accList { get; set; } // DropDown List items
    public Id accListItem { get; set;} // Id выбранного аккаунта / выбранный аккаунт в DropDown List
    public Set<Id> idSet = new Set<Id>(); // Set для выбранного Id
    public List<Opportunity> oppList { get; set; } // Лист подходящих Opps

    public List<SelectOption> createDropDown() { // Создаем DropDown List
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('','--Choose Account--'));
        for (Account acc : [SELECT Id,Name, OpportunityId__c FROM Account]) {
            options.add(new SelectOption(acc.Id, acc.Name));
        }
        return options;
    }

    public Actrlr(ApexPages.StandardController controller) {
            accList = createDropDown();
        accList.sort();
    }

    public PageReference refresh() {
        idSet.clear(); // Очищаем прошлые Id выбранного аккаунта
        idSet.add(accListItem);// Добавляем Id выбранного аккаунта
        oppList = [SELECT Id,Name, AccountId FROM Opportunity WHERE AccountId IN: idSet]; // Получаем Related Opps
        return null;
    }

}

