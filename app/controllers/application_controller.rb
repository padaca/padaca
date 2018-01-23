class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_account!, :except => [:impressum]

  before_action :ensure_msgs

  after_action :verify_old_url

  def ensure_msgs
    #session[:msg] = [] unless session[:msg]
  end

  def msg(msg)
    #session[:msg] = [] unless session[:msg]
    #session[:msg].push msg
  end

  def capture_old_url

    new_url = request.path

    if session[:old_url]

      msg "capture: update ctx to #{new_url}"
      session[:old_url]["ctx"] = new_url

    else

      session[:old_url] = { "url" => request.referrer, "ctx" => new_url }
      msg "capture new: #{session[:old_url]}"

    end

  end

  def restore_old_url

    if session[:old_url]

      url = session[:old_url]["url"]

      request.env["HTTP_REFERER"] = url

      msg "restore: #{url}"

    else
      msg "restore failed, no old_url"
    end

  end

  def verify_old_url

    old_url = session[:old_url]
    new_url = request.path

    if old_url
      if new_url != old_url["ctx"]
        msg "could not verify ctx: #{new_url} != #{old_url && old_url["ctx"] || "nil" }"
        session[:old_url] = nil
      end
    end
  end

end
