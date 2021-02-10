module Pages
  module Uniao
    class Uniao < SitePrism::Page

      element :btn_unificar, '.btn_unificar '
      element :cbx_unificar, '#campo_filtro_unificar'
      element :busca, '#busca'
      element :btn_pesquisar, '#pesquisar'

      elements :btn_check, ' #lista_fornecedor  #ck_fornecedor\[\]'
      element :btn_proxima, '#proxima_pagina'
      elements :bolinha_check, '#lista_principal .form-check-label'
      element :btn_salvar, '#btn_salvar_unificar'

      def unificar
        #uniaoAPI =  HTTParty.get('https://api-desafio.vercel.app/api/validacao/uniao')
        #nomeAPI = uniaoAPI.parsed_response[1]["nome"]
        nomeAPI = "Zé Pinguço"

        btn_unificar.gclick
        cbx_unificar.select "Razão/Nome"
        busca.gset nomeAPI
        btn_pesquisar.gclick

        btn_check.first.gclick
        btn_check.last.gclick
        btn_proxima.gclick
        bolinha_check.first.gclick
        btn_salvar.gclick
      end

    end
  end
end

