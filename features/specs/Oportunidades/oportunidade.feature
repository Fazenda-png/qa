#language:pt

Funcionalidade: Cadastro de oportunidade

  Contexto: Logado
    Dado que esteja logado
    E esteja na pagina de oportunidades

    @oportunidade
    Cenário: Cadastro
      Quando cadastrar oportunidade
      Então deverá aparecer "Registro cadastrado com sucesso."

    @oportunidadeErro
    Esquema do Cenário: Cadastro erro
      Quando tentar cadastrar oportunidade "<erro>"
      Então deverá aparecer "<mensagem>" e "<local>"

      Exemplos:

      | erro         | mensagem                            | local           |
      | nome         | O campo Razão Social é obrigatorio. | input_name_op   |
      | cpf          | Informe um CPF válido.              | input_cpf       |
      | email_op     | Please enter a valid email address. | input_email_op  |
      | cnpj         | Informe um CNPJ válido.             | input_cnpj      |
      | email_con    | Please enter a valid email address. | input_email_con |

    @deletar
    Cenário: Deletar
      Dado que possua Oportunidade cadastrada
      Quando deletar Oportunidades
      Então deverá aparecer a mensagem: "Removido com sucesso."
