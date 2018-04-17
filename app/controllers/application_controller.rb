class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :nav_menu

  def nav_menu
    @pages = Page.all
  end
end
