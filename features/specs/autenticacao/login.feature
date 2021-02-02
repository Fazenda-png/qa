#language:pt

@login
Funcionalidade: Login
  Contexto: Home
    Dado que esteja na Home
    Quando acessar Login

    @loginCadastrado
    Cenário: Usuário Cadastrado
      Quando realizar login com usuário válido
      Então deverá aparecer o header de usuário

    @loginErro
    Esquema do Cenário: Usuário Cadastrado
      Quando realizar login com "<email>" e "<senha>"
      Então deverá aparecer o "<aviso>"

      Exemplos:
      | email | senha | aviso                                                                    |
      |       |       | O campo login é obrigatorio.                                             |
      | a@a   |       | O campo senha é obrigatorio.                                             |
      |       | 1     | O campo senha deve conter no mínimo 3 caracteres.                        |
      | a     | 123   | Informe um email válido                                                  |
      | a@a   | 123   | Usuário ou senha inválidos! Verifique e-mail e senha, e tente novamente. |
