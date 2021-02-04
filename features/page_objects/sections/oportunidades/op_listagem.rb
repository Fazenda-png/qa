module Sections
  module Oportunidades
    class ListagemOp < SitePrism::Section
      element :btn_cadastro, 'a[class*="btn_novo_oportunidade"]'

      element :btn_deletar, '#deletar'
      elements :btn_plus, '.btn btn-sm.light-blue.accent-4.dropdown-toggle.btn-add'
    end
  end
end
