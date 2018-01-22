module FahrtsHelper

  def fahrt_abfahrt_format(abfahrt)
    if abfahrt < DateTime.now
      content_tag :s, abfahrt
    else
      abfahrt
    end
  end
end
