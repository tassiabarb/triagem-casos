List<Case> casos = [SELECT Id FROM Case WHERE Subject LIKE 'Caso de teste%' ORDER BY CaseNumber];
List<String> status = new List<String>{'New', 'Working', 'Escalated', 'Closed'};

for (Integer i = 0; i < casos.size(); i++) {
    casos[i].Status = status[Math.mod(i, 4)];
    if (i < 6) {
        casos[i].Data_Ultima_Interacao__c = System.now().addDays(-1);
    }
}
update casos;