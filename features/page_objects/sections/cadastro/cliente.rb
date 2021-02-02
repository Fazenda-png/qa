require 'httparty'

module Sections
  module Cadastro
    class Cliente < SitePrism::Section

      element :nome, '#razao'
      element :cpf, '#cpf'
      element :email, '#email'
      element :celular, '#celular'
      element :cep, '#cep'
      element :logradouro, '#logradouro'
      element :numero, '#numero'
      element :bairro, '#bairro'
      element :cidade, '#cidade'
      element :uf, '#uf'
      element :pais, '#pais'
      element :nascimento, '#data_nascimento'

      def cadastro
        emailAPI = HTTParty.get('https://api-desafio.vercel.app/api/fixo/cliente')
        emailPAULO = emailAPI.parsed_response[0]["email"]

        dados

        nome.gset @nome
        cpf.gset @cpf
        nascimento.gset @nas
        email.gset emailPAULO
        celular.gset @celular
        cep.gset @cep
        logradouro.gset @log
        numero.gset @num
        bairro.gset @bairro
        cidade.gset @city
        uf.select "AM"
        pais.gset @pais

        post = HTTParty.post('https://api-desafio.vercel.app/api/validacao/cliente',:headers => {'cache-control': 'public, max-age=0, must-revalidate','content-type': 'application/json'}, :body => {'email': emailPAULO, 'cpf': @cpf, 'nome': @nome, 'nascimento': @nas, 'celular': @celular, 'cep': @cep, 'logradouro': @log, 'numero': @num, 'bairro': @bairro, 'cidade': @city, 'pais': @pais}.to_json)

      end

      def dados
        usuario = Factory.user
        endereco = Factory.address
        @nome = usuario[:nome]
        @cpf = usuario[:cpf]
        @nas = usuario[:nascimento]
        @celular = usuario[:celular]
        @cep = endereco[:cep]
        @log = endereco[:logradouro]
        @num = endereco[:numero]
        @bairro = endereco[:bairro]
        @city = endereco[:cidade]
        @pais = endereco[:pais]
      end

      def cadastro_erro(nomeSet, emailSet, cpfSet)

        nome.set nomeSet
        email.set emailSet
        cpf.set cpfSet
      end

    end
  end
end
