Dir[File.join(File.dirname(__FILE__), 'page_objects/pages/*.rb')]
  .sort.each { |file| require file }

  module Pages
    class ECPages
      class << self
        def home
          Pages::Home::Home.new
        end
        def login
          Pages::Login::Login.new
        end
<<<<<<< HEAD
        def oportunidades
          Pages::Oportunidades::Oportunidades.new
=======
        def cadastro
          Pages::Cadastro::Cadastro.new
>>>>>>> 13132097e022204ee286dd7d69f8267dabea4a19
        end
      end
    end
  end
