
module Pages

    class Home < SitePrism::Page
      set_url '/'

      element :popup, '#onesignal-slidedown-cancel-button'
      element :btn_logoHome, 'a[class=logo]'

    end
  end

