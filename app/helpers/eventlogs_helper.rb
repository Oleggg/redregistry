module EventlogsHelper
  def event_text(e)
    case e.event_type
      when Eventlog::EVENT_TYPES[:user_login]
        "Пользователь <i>#{e.event_data["login"]}</i> вошёл c IP адреса: <i>#{e.event_data["ip"]}</i>"
      when Eventlog::EVENT_TYPES[:user_logout]
        "Пользователь <i>#{e.event_data["login"]}</i> вышёл."
      else
        ""
    end
  end
end

