class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource

  # constant
  PER_PAGE = 30

  protected
    def layout_by_resource
      if devise_controller?
        "login"
      else
        "application"
      end
    end
end
