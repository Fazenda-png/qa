module Sections
  module Oportunidades
    class Formulario < SitePrism::Section
      element :edt_nome, '#razao_cliente'
      element :cbx_tp_pessoa, '#tipo_pessoa'
      element :edt_cpf, '#cpf'
      element :edt_cnpj, '#cnpj'
      element :edt_celular, '#celular_cliente'
      element :edt_email, '#email_cliente'
      element :edt_telefone, '#fone_cliente'
      element :cbx_area_atu, '#id_atuacao'
      element :cbx_origem, '#id_origem'
      element :edt_cidade, '#cidade'
      element :cbx_uf, '#uf'
      element :cbx_status, '#select-options-8b22123e-ae7c-4828-9ce4-9fbd38e51270'
      element :cbx_responsavel, '#id_usuario'
      element :cbx_equipe, '#id_equipe'
      element :edt_valor, '#valor'
      element :edt_descricao, '#descricao'
      element :cbx_etapa, '#id_etapa'

      element :edt_contato_nome, '#nome_contato'
      element :edt_contato_email, '#cargo_contato'
      element :edt_contato_fone, '#fone_contato'
      element :edt_contato_cel, '#celular_contato'
      element :btn_novo_contato, '#btn-inserir-novo-contato'
      elements :rd_contato_principal, '#rd_contato_principal_'

      element :lista_contatos, '#lista_contatos_oportunidade'
      element :btn_salvar, '#btn_salvar_oportunidade'

      def geraOportunidade
        # user = Factory.user
        # user[:cpf]
        # user[:cnpj]
        # {
        #   nome: user[:nome],
        #   tipo_pessoa:
        #   cpf_cnpj: documento
        #   celular: user[:celular],
        #   email: user[:email],
        #   telefone: user[:telefone],
        #   area:
        #   origem:
        #   cidade:
        #   uf:
        #   status:
        #   responsavel:
        #   equipe:
        #   valor:
        #   descricao:
        #   etapa:

        #   contato_nome: user[:nome] + ' contato',
        #   contato_cargo: user[:apelido],
        #   contato_email: user[:email],
        #   contato_telefone: user[:telefone],
        #   contato_celular: user[:celular],
        # }
      end

      def cadastraOportunidade
        

      end

    end
  end
end
