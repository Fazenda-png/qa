#language:pt

@Oportunidade
Funcionalidade: Cadastro de oportunidade

    Contexto: Logado
        Dado que esteja logado
        E esteja na pagina de oportunidades
    
    Cenário: Cadastro
        Quando preencher os campos "Nome", "Tipo", "CPF", "Celular", "Email", "Telefone", "Area de Atuação", "Origem", "Cidade", "UF", "Tag", "Responsavel", "Equipe", "Valor", "Titulo", "Etapa"
        E preencher os campos de contato "Nome", "Cargo", "Email", "Telefone", "Celular"
        Então deverá aparecer "Registro cadastrado com sucesso."