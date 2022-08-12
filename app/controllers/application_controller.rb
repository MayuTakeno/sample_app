class ApplicationController < ActionController::Base

  def after_sign_in_for(resource)
    books_path
  end
end
