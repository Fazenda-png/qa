#language:pt

@Oportunidade
Funcionalidade: Cadastro de oportunidade

    Contexto: Logado
        Dado que esteja logado
        E esteja na pagina de oportunidades
    
    Cenário: Cadastro
        Quando preencher os campos
        E preencher os campos de contato
        Então deverá aparecer "Registro cadastrado com sucesso."