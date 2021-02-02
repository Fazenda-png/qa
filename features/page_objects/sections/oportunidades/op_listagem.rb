module Sections
  module Oportunidades
    class ListagemOp < SitePrism::Section
      element :btn_cadastro, '.btn_novo_oportunidade.btn.btn-sm.success-color'
      element :btn_deletar, '#deletar'
      elements :btn_plus, '.btn btn-sm.light-blue.accent-4.dropdown-toggle.btn-add'
    end
  end
end
