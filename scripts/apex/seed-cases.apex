List<Account> contas = [SELECT Id FROM Account LIMIT 5];
List<Case> casos = new List<Case>();
List<String> categorias = new List<String>{'Financeiro', 'Técnico', 'Comercial', 'Dúvida'};
List<String> urgencias = new List<String>{'Baixa', 'Média', 'Alta', 'Crítica'};

for (Integer i = 0; i < 20; i++) {
    casos.add(new Case(
        Subject = 'Caso de teste ' + (i + 1),
        Status = 'New',
        Origin = 'Web',
        AccountId = contas[Math.mod(i, contas.size())].Id,
        Categoria__c = categorias[Math.mod(i, 4)],
        Nivel_Urgencia__c = urgencias[Math.mod(i, 4)],
        Data_Ultima_Interacao__c = System.now().addDays(-Math.mod(i, 7))
    ));
}
insert casos;