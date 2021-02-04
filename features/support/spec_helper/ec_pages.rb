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
        def oportunidades
          Pages::Oportunidades::Oportunidades.new
        end
        def cadastro
          Pages::Cadastro::Cadastro.new
        end

    end
  end
end
