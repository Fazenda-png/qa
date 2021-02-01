Dir[File.join(File.dirname(__FILE__), 'page_objects/pages/*.rb')]
  .sort.each { |file| require file }


  module Pages
    class ECPages
      class << self
        def home
          Pages::Home.new
        end
      end
    end
  end
