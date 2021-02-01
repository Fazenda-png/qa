module Sections
  module Oportunidades
    class ListagemOp < SitePrism::Section
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
    end
  end
end
