require 'httparty'

module Sections
  module Cadastro
    class Cliente < SitePrism::Section

      element :btn_salvar, '#btn_adicionar'
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

      def cadastro(cont)
        emailAPI = HTTParty.get('https://api-desafio.vercel.app/api/fixo/cliente')
        @email_fixo = emailAPI.parsed_response[cont]["email"]
        cli = dados

        nome.gset cli[:nome]
        cpf.gset cli[:cpf]
        nascimento.gset cli[:nascimento]
        email.gset @email_fixo
        celular.gset cli[:celular]
        cep.gset cli[:cep]
        logradouro.gset cli[:logradouro]
        numero.gset cli[:numero]
        bairro.gset cli[:bairro]
        cidade.gset cli[:cidade]
        uf.select "AM"
        pais.gset cli[:pais]
        btn_salvar.gclick

        time = Time.new
        file = File.open('reports/clientes/'+ time.strftime("%m-%d-%Y.%H.%M.%S") + ".json", 'w') do |fline|
          fline.puts (cli.to_json)
        end
        cli
      end

      def dados
        usuario = Factory.user
        endereco = Factory.address
        clientes = {
          nome: usuario[:nome],
          cpf: usuario[:cpf],
          nascimento: usuario[:nascimento],
          email: @email_fixo,
          celular: usuario[:celular],
          cep: endereco[:cep],
          logradouro: endereco[:logradouro],
          numero: endereco[:numero],
          bairro: endereco[:bairro],
          cidade: endereco[:cidade],
          pais: endereco[:pais]
        }

        post = HTTParty.post('https://api-desafio.vercel.app/api/validacao/cliente',:headers => {'cache-control': 'public, max-age=0, must-revalidate','content-type': 'application/json'}, :body => clientes.to_json)
        clientes
      end

      def cadastro_erro(nomeSet, emailSet, cpfSet)
        nome.gset nomeSet
        email.gset emailSet
        cpf.gset cpfSet
        btn_salvar.gclick
      end

      def uniaoCadastro1
        nome.gset 'Zé Pinguço'
        celular.gset '999999999'
        btn_salvar.gclick
        post = HTTParty.post('https://api-desafio.vercel.app/api/validacao/cliente',:headers => {'cache-control': 'public, max-age=0, must-revalidate','content-type': 'application/json'}, :body => {nome: "Zé Pinguço", cpf: "", nascimento: "", email: "", celular: "999999999", cep: "", logradouro: "", numero: "", bairro: "", cidade: "", pais: ""}.to_json)
      end

      def uniaoCadastro2
        nome.gset 'Zé Pinguço'
        email.gset 'teste@teste.com'
        btn_salvar.gclick
        post = HTTParty.post('https://api-desafio.vercel.app/api/validacao/cliente',:headers => {'cache-control': 'public, max-age=0, must-revalidate','content-type': 'application/json'}, :body => {nome: "Zé Pinguço", cpf: "", nascimento: "", email: "teste@teste.com", celular: "", cep: "", logradouro: "", numero: "", bairro: "", cidade: "", pais: ""}.to_json)
      end

    end
  end
end
