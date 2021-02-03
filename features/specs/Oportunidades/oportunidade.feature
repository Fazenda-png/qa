#language:pt

@Oportunidade
Funcionalidade: Cadastro de oportunidade

    Contexto: Logado
        Dado que esteja logado
        E esteja na pagina de oportunidades
    
    Cenário: Cadastro
        Quando preencher os campos
        Então deverá aparecer "Registro cadastrado com sucesso."

    Esquema do Cenário: Cadastro erro
        Quando preencher os campos "<Nome>", "<Tipo>", "<CPF>", "<CNPJ>", "<Email>"
        E preencher os campos do contato "<Nome>", "<Email>"
        Então deverá aparecer "mensagem""local"

        Exemplos: 

        | Nome    | Tipo            | CPF          | CNPJ         | Email               | Nome        | Email               | mensagem                                                     | Local           |
        |         | Pessoa Física   | 042839560    |              | Pule1927@rhyta.com  | TESTE33     | Pule1927@dayrep.com | O campo Razão Social é obrigatorio.                          | input_name_op   |
        | TESTE32 | Pessoa Física   |              |              | Pule1927@rhyta.com  | TESTE33     | Pule1927@dayrep.com | Informe um CPF válido.                                       | input_cpf       |
        | TESTE32 | Pessoa Física   | 042839560    |              |                     | TESTE33     | Pule1927@dayrep.com | Please enter a valid email address.                          | input_email_op  |
        | TESTE32 | Pessoa Física   | 042839560    |              | Pule1927@rhyta.com  |             | Pule1927@dayrep.com | Você precisa informar o nome do Contato que será cadastrado. | input_name_con  |
        | TESTE32 | Pessoa Jurídica |              |              | Pule1927@rhyta.com  | TESTE33     | Pule1927@dayrep.com | Informe um CNPJ válido                                       | input_cnpj      |
        | TESTE32 | Pessoa Jurídica |              | 972234900001 | Pule1927@rhyta.com  | TESTE33     |                     | Please enter a valid email address.                          | input_email_con |