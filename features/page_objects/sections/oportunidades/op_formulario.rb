module Sections
  module Oportunidades
    class Formulario < SitePrism::Section
        element :btn_cadastro, '.btn_novo_oportunidade.btn.btn-sm.success-color'
        element :btn_deletar, '#deletar'
    end
  end
end
