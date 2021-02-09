#language:pt

Funcionalidade: Cadastro de oportunidade

  Contexto: Logado
    Dado que esteja logado
    E esteja na pagina de oportunidades

    @oportunidade
    Cenário: Cadastro
      Quando preencher os campos
      Então deverá aparecer "Registro cadastrado com sucesso."

    @oportunidadeErro
    Esquema do Cenário: Cadastro erro
      Quando preencher os campos "<erro>"
      Então deverá aparecer "<mensagem>" e "<local>"

      Exemplos:

      | erro         | mensagem                            | local           |
      | nome         | O campo Razão Social é obrigatorio. | input_name_op   |
      | cpf          | Informe um CPF válido.              | input_cpf       |
      | email_op     | Please enter a valid email address. | input_email_op  |
      | cnpj         | Informe um CNPJ válido.             | input_cnpj      |
      | email_con    | Please enter a valid email address. | input_email_con |
