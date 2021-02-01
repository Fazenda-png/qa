#language:pt

@login
Funcionalidade: Login
  Contexto: Home
    Dado que esteja em LOGIN

    @loginCadastrado
    Cenário: Usuário Cadastrado
      Quando realizar login com "automationdesafio@mailsac.com" e "automation123"
      Então deverá aparecer a mensagem "Início"
      
      #.breadcrumb ul:first-child li:first-child



