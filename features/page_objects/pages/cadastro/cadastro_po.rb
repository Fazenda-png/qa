require_relative '../../sections/cadastro/cliente.rb'

module Pages
  module Cadastro
    class Cadastro < SitePrism::Page
      set_url = '/cliente'

      section :cliente, Sections::Cadastro::Cliente, '#gerais'

      element :btn_cadastrar, '#cadastrar'
      element :btn_salvar, '#btn_adicionar'
      element :mensagem, '.nova_lista'
      element :mensagemErro, '.mdb-skin-custom'

      def cadastrar
        btn_cadastrar.click
        cliente.cadastro
        btn_salvar.click
      end

      def cadastrar_erro(nomeSet, emailSet, cpfSet)
        btn_cadastrar.click
        cliente.cadastro_erro(nomeSet, emailSet, cpfSet)
        btn_salvar.click
      end
    end
  end
end
