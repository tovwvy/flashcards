# app/controllers/concerns/sessions_helper.rb
module SessionsHelper
    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to login_path
      end
    end
  
    def logged_in?
      # Логіка перевірки входу користувача
      # Наприклад, можна перевірити наявність поточного користувача
      current_user.present?
    end
  end
  