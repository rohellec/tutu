class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  layout "admin"

  def index
    render html: "", layout: true
  end

  private

  def check_admin
    return if current_user.admin?
    redirect_to root_path, alert: "You are not authorized to view this page"
  end
end
