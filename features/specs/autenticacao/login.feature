#language:pt

@login
Funcionalidade: Login
  Contexto: Home
    Dado que esteja na Home
    Quando acessar Login

    @loginCadastrado
    Cenário: Usuário Cadastrado
      Quando realizar login com "automationdesafio@mailsac.com" e "automation123"
      Então deverá aparecer o header de usuário
