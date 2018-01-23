module ApplicationHelper

  def back
    if session[:old_url]
      session[:old_url]["url"]
    else
      :back
    end
  end
end
