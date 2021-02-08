#language:pt

Funcionalidade: União

  Contexto: Logado
    Dado que esteja logado
    E que esteja em clientes

    @uniao
    Cenário: União Clientes
      Dado que tenha clientes com o mesmo nome
      Quando unificar esses clientes
      Então deverá aparecer a mensagem "Registro unificado com sucesso."


