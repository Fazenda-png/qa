module Sections
  module Headers
    class MainHeader < SitePrism::Section

      element :btn_login, '[data-id="3039a4c9"]'

      def login
        btn_login.gclick
      end

    end
  end
end
