require_relative '../../sections/headers/main_header.rb'
require_relative '../../sections/headers/auth_header.rb'

module Pages
  module Home
    class Home < SitePrism::Page
      set_url '/'

      section :main_header, Sections::Headers::MainHeader, '.elementor-element-42512164'
      section :auth_header, Sections::Headers::AuthHeader, '#topo'
      #section :barra, Sections::Headers::BarLateral, ".menu_lateral"

      element :popup, '#onesignal-slidedown-cancel-button'
      element :btn_logoHome, 'a[class=logo]'

      def abrir_login
        main_header.login
      end

    end
  end
end