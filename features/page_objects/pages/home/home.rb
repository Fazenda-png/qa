require_relative '../../sections/headers/main_header.rb'
require_relative '../../sections/headers/auth_header.rb'

module Pages
  module Home
    class Home < SitePrism::Page
      set_url '/'

      section :main_header, Sections::Headers::MainHeader, '.elementor-element-42512164'
      section :auth_header, Sections::Headers::AuthHeader, '#topo'
      #section :barra, Sections::Headers::BarLateral, ".menu_lateral"

      element :btn_clientes, '[href="/cliente"]'
      element :btn_oportunidades, '[href="/oportunidade"]'

      element :popup, '#onesignal-slidedown-cancel-button'
      element :btn_logoHome, 'a[class=logo]'

      def abrir_cliente
        btn_clientes.gclick
      end

      def abrir_login
        main_header.login
      end

      def abrir_oportunidades
        btn_oportunidades.gclick
      end
    end
  end
end
