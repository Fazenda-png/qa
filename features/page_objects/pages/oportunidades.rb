require_relative '../sections/oportunidades/op_listagem.rb'
require_relative '../sections/oportunidades/op_formulario.rb'

module Pages
  module Oportunidades
    class Oportunidades < SitePrism::Page
      section :listagem, Sections::Oportunidade::ListagemOp, '.main-wrapper > .cont_geral'
      section :formulario, Sections::Oportunidade::Formulario, '#formulario_oportunidade'
    end
  end
end

