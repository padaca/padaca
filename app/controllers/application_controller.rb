class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_account!, :except => [:impressum]
  before_action :check_old_url

  def store_old_url
    if session[:old_url]
      if session[:old_url]["ctx"] == request.referrer
      end
    else
      session[:old_url] = { "url" => request.referrer, "ctx" => request.url }
    end
  end

  def restore_old_url
    if session[:old_url]
      redirect_to session[:old_url]["url"]
      session[:old_url] = nil
      return
    end
  end

  def check_old_url
    url = session[:old_url]
    if url
      session[:debug] = {ref: request.referer}
      if url["ctx"] == request.original_url || url["ctx"] == request.referer
        session[:old_url]["ctx"] = request.url
      else
        session[:old_url] = nil
      end
    end

    session[:old_url] = nil if url and url["ctx"] == url["url"]
  end

end
