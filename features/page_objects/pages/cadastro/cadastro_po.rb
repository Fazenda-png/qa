require_relative '../../sections/cadastro/cliente.rb'
require 'httparty'

module Pages
  module Cadastro
    class Cadastro < SitePrism::Page
      set_url = '/cliente'

      section :cliente, Sections::Cadastro::Cliente, '.add_novo'

      element :btn_cadastrar, '#cadastrar'
      element :btn_confirma, '#btn_confirmar'
      element :btn_del, '#deletar'
      element :check_all, '#checkall'
      element :mensagem, '.nova_lista'
      element :mensagemErro, '.mdb-skin-custom'
      elements :verifica_cli, '.body_lista > ul'

      def cadastrar
        uniaoFinal
        cont = 0
        clientes = Array.new
        3.times do
          btn_cadastrar.gclick
          clientes.push(cliente.cadastro(cont))
          cont += 1
        end
        clientes
      end

      def cadastro_exception
        btn_cadastrar.gclick
        cliente.cpf_erro
      end

      def cadastrar_erro(nomeSet, emailSet, cpfSet)
        btn_cadastrar.gclick
        cliente.cadastro_erro(nomeSet, emailSet, cpfSet)
      end

      def exclui_cli
        #binding.pry
        if has_verifica_cli?
          check_all.gclick
          btn_del.gclick
          btn_confirma.gclick
        end
      end

      def postCliente(clientes)
        clientes.each { |cliente|
          post = HTTParty.post('https://api-desafio.vercel.app/api/cliente',:headers => {'cache-control': 'public, max-age=0, must-revalidate','content-type': 'application/json'}, :body => cliente.to_json)
        }
      end

      def postUniao
        post = HTTParty.post('https://api-desafio.vercel.app/api/validacao/cliente',:headers => {'cache-control': 'public, max-age=0, must-revalidate','content-type': 'application/json'}, :body => {nome: "Zé Pinguço", cpf: "", nascimento: "", email: "", celular: "999999999", cep: "", logradouro: "", numero: "", bairro: "", cidade: "", pais: ""}.to_json)

        post = HTTParty.post('https://api-desafio.vercel.app/api/validacao/cliente',:headers => {'cache-control': 'public, max-age=0, must-revalidate','content-type': 'application/json'}, :body => {nome: "Zé Pinguço", cpf: "", nascimento: "", email: "esse@aqui.com", celular: "999999999", cep: "", logradouro: "", numero: "", bairro: "", cidade: "", pais: ""}.to_json)
      end

      def uniaoFinal
        postUniao
        btn_cadastrar.gclick
        cliente.uniaoCadastro1
        btn_cadastrar.gclick
        cliente.uniaoCadastro2
      end

    end
  end
end
