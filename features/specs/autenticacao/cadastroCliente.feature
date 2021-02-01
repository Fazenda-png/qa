#language:pt

@cadastro
Funcionalidade: Cadastro Cliente
  Contexto: Home
    Dado que esteja em FAÇA SEU CADASTRO ONE CLICK

    @cadastroNovo
    Cenário: Novo Usuário
      Quando preencher os campos com "", "", "", "", "" e ""
      Entao deverá aparecer a mensagem de boas vindas "DETALHES DA SUA CONTA"

    @cadastroTentativa
    Esquema do Cenário:
      Quando preencher os campos com
      Entao deverá aparecer a mensagem de erro









