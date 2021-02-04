require_relative '../../sections/cadastro/cliente.rb'

module Pages
  module Cadastro
    class Cadastro < SitePrism::Page
      set_url = '/cliente'

      section :cliente, Sections::Cadastro::Cliente, '.add_novo'

      element :btn_cadastrar, '#cadastrar'
      element :mensagem, '.nova_lista'
      element :mensagemErro, '.mdb-skin-custom'

      def cadastrar
        cont = 0
        3.times do
          btn_cadastrar.gclick
          cliente.cadastro(cont)
          cont +=1
        end
      end

      def cadastrar_erro(nomeSet, emailSet, cpfSet)
        btn_cadastrar.gclick
        cliente.cadastro_erro(nomeSet, emailSet, cpfSet)
      end
    end
  end
end
