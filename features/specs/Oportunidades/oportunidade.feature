#language:pt


Funcionalidade: Cadastro de oportunidade

    Contexto: Logado
        Dado que esteja logado
        E esteja na pagina de oportunidades

    Cenário: Cadastro
        Quando preencher os campos
        Então deverá aparecer "Registro cadastrado com sucesso."
    @Oportunidade
    Esquema do Cenário: Cadastro erro
        Quando preencher os campos "<Nome>", "<Tipo>", "<CPF>", "<CNPJ>", "<Email>", "<Nome_cont>", "<Email_cont>"
        Então deverá aparecer "<mensagem>" e "<local>"

        Exemplos:

        | Nome    | Tipo            | CPF          | CNPJ         | Email               | Nome_cont   | Email_cont          | mensagem                                                     | local           |
        |         | Pessoa Física   | 042839560    |              | Pule1927@rhyta.com  | TESTE33     | Pule1927@dayrep.com | O campo Razão Social é obrigatorio.                          | input_name_op   |
        | TESTE32 | Pessoa Física   | 111111111    |              | Pule1927@rhyta.com  | TESTE33     | Pule1927@dayrep.com | Informe um CPF válido.                                       | input_cpf       |
        | TESTE32 | Pessoa Física   | 042839560    |              | teste__             | TESTE33     | Pule1927@dayrep.com | Please enter a valid email address.                          | input_email_op  |
        | TESTE32 | Pessoa Jurídica |              | 111111111111 | Pule1927@rhyta.com  | TESTE33     | Pule1927@dayrep.com | Informe um CNPJ válido.                                      | input_cnpj      |
        | TESTE32 | Pessoa Jurídica |              | 972234900001 | Pule1927@rhyta.com  | TESTE33     | teste__             | Please enter a valid email address.                          | input_email_con |
