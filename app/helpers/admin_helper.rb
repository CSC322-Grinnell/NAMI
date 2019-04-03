module AdminHelper
  def authenticate_admin!
      if !current_user.try(:admin?)
          flash[:errors] = ["Only an Admin can view this page!"]
          redirect_to '/providers/profile'
      end
  end
end