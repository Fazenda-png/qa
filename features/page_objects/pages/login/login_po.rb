# require_relative '../../sections/autenticacao/login.rb'

module Pages
  module Login
    class Login < SitePrism::Page
      set_url '/auth'

      element :input_email, '#login'
      element :input_senha, '#senha'
      element :btn_login, '#entrar'

      def logar(email, senha)
        input_email.gset email
        input_senha.gset senha

        btn_login.gclick
      end

    end
  end
end
