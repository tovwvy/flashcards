# app/helpers/sessions_helper.rb
module SessionsHelper
    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to login_path
      end
    end
  
    # Додайте інші методи аутентифікації, якщо потрібно
  end
  