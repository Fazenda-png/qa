#language:pt

@cadastro
Funcionalidade: Cadastrar Cliente
  Contexto: Página dos clientes
    Dado que esteja credenciado
    E que esteja em clientes

    Cenário: Cadastro Cliente
      Quando preencher o formulário
      Então deverá aparecer a mensagem

    @erro
    Esquema do Cenário: Cadastro Cliente Excption
      Quando preencher o formulário com "<nome>", "<email>", "<cpf>"
      Então deverá aparecer a "<mensagem>"

      Exemplos:
      | nome  | email | cpf            | mensagem                                                 |
      | a     |       |                | O campo Razão social deve conter no mínimo 2 caracteres. |
      | aa    | b     | 867.778.800-03 | O CPF informado já existe.                               |
      | aa    | a     |                | O E-mail informado já existe.                            |
