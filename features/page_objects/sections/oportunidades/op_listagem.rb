module Sections
  module Oportunidades
    class ListagemOp < SitePrism::Section
      element :btn_cadastro, 'a[class*="btn_novo_oportunidade"]'

      element :btn_deletar, '#deletar'
      elements :btn_plus, '.btn btn-sm.light-blue.accent-4.dropdown-toggle.btn-add'
      elements :oportunidades, '.body_lista_principal > tr'
      element :checkall, '#checkall'
    end
  end
end
