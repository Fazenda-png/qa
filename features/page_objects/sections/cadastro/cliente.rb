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

        nome.gset dados[:nome]
        cpf.gset dados[:cpf]
        nascimento.gset dados[:nas]
        email.gset @email_fixo
        celular.gset dados[:celular]
        cep.gset dados[:cep]
        logradouro.gset dados[:log]
        numero.gset dados[:num]
        bairro.gset dados[:bairro]
        cidade.gset dados[:city]
        uf.select "AM"
        pais.gset dados[:pais]
        btn_salvar.gclick

        post = HTTParty.post('https://api-desafio.vercel.app/api/validacao/cliente',:headers => {'cache-control': 'public, max-age=0, must-revalidate','content-type': 'application/json'}, :body => dados.to_json)

        time = Time.new
        file = File.open('reports/clientes/'+ time.strftime("%m-%d-%Y.%H.%M.%S") + ".json", 'w') do |fline|
          fline.puts (dados.to_json)
        end
      end

      def dados
        usuario = Factory.user
        endereco = Factory.address
        {
          nome: usuario[:nome],
          cpf: usuario[:cpf],
          nas: usuario[:nascimento],
          email: @email_fixo,
          celular: usuario[:celular],
          cep: endereco[:cep],
          log: endereco[:logradouro],
          num: endereco[:numero],
          bairro: endereco[:bairro],
          city: endereco[:cidade],
          pais: endereco[:pais]
        }
      end

      def cadastro_erro(nomeSet, emailSet, cpfSet)
        nome.gset nomeSet
        email.gset emailSet
        cpf.gset cpfSet
        btn_salvar.gclick
      end

    end
  end
end
