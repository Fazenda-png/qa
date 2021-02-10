require_relative '../../sections/oportunidades/op_listagem.rb'
require_relative '../../sections/oportunidades/op_formulario.rb'

module Pages
  module Oportunidades
    class Oportunidades < SitePrism::Page
      set_url '/oportunidade'

      section :listagem, Sections::Oportunidades::ListagemOp, '.main-wrapper > .cont_geral'
      section :formulario, Sections::Oportunidades::Formulario, '#formulario_oportunidade'

      element :btn_confirmar, '#btn_confirmar'
    end
  end
end
