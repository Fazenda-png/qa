require_relative '../../sections/cadastro/cliente.rb'
require 'httparty'

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
        clientes = Array.new
        3.times do
          btn_cadastrar.gclick
          clientes.push(cliente.cadastro(cont))
          cont += 1
        end
        clientes
      end

      def cadastrar_erro(nomeSet, emailSet, cpfSet)
        btn_cadastrar.gclick
        cliente.cadastro_erro(nomeSet, emailSet, cpfSet)
      end

      def postCliente(clientes)
        clientes.each { |cliente|
          post = HTTParty.post('https://api-desafio.vercel.app/api/cliente',:headers => {'cache-control': 'public, max-age=0, must-revalidate','content-type': 'application/json'}, :body => cliente.to_json)
        }
      end

    end
  end
end
