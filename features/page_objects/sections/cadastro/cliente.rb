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
        usuario = Factory.user
        endereco = Factory.address
        nome.gset usuario[:nome]
        cpf.gset usuario[:cpf]
        nascimento.gset usuario[:nascimento]

        #email.gset

        celular.gset usuario[:celular]
        cep.gset endereco[:cep]
        logradouro.gset endereco[:logradouro]
        numero.gset endereco[:numero]
        bairro.gset endereco[:bairro]
        cidade.gset endereco[:cidade]
        uf.select "AM"
        pais.gset endereco[:pais]
      end

      def cadastro_erro(nomeSet, emailSet, cpfSet)
        nome.set nomeSet
        email.set emailSet
        cpf.set cpfSet
      end

    end
  end
end
