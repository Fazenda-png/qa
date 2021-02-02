# require_relative '../../sections/autenticacao/login.rb'

module Pages
  module Login
    class Login < SitePrism::Page
      set_url '/auth'

      element :input_email, '#login'
      element :input_senha, '#senha'
      element :btn_entrar, '#entrar'

      def logar
        aut = Factory.user

        input_email.gset aut[:aut_email]
        input_senha.gset aut[:aut_senha]

        (0..2).each do
          if has_btn_entrar?
            btn_entrar.gclick
          end
        end
      end

    end
  end
end
