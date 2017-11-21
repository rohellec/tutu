class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Welcome, #{current_user.name}!"
  end
end
