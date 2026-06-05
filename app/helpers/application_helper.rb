module ApplicationHelper


  def course_icon(name, size: 16)
    s = size

    svg = ->(content){
      raw("<svg width='#{s}' height='#{s}' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='1.6' stroke-linecap='round' stroke-linejoin='round'>#{content}</svg>")
    }

    case name
    when "logout" then svg.("<path d='M15 4h3a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2h-3'/><path d='M10 17l-5-5 5-5'/><path d='M5 12h11'/>")
    when "home"          then svg.("<path d='M3 11.5 12 4l9 7.5'/><path d='M5 10v10h14V10'/>")
    when "users"         then svg.("<circle cx='9' cy='9' r='3.5'/><path d='M3 19c0-3 2.7-5 6-5s6 2 6 5'/><circle cx='17' cy='9' r='2.5'/><path d='M21 18c0-2-1.4-3.5-4-4'/>")
    when "settings"      then svg.("<circle cx='12' cy='12' r='3'/><path d='M19.4 15a1.7 1.7 0 0 0 .3 1.8l.1.1a2 2 0 1 1-2.8 2.8l-.1-.1a1.7 1.7 0 0 0-1.8-.3 1.7 1.7 0 0 0-1 1.5V21a2 2 0 0 1-4 0v-.1A1.7 1.7 0 0 0 9 19.4a1.7 1.7 0 0 0-1.8.3l-.1.1a2 2 0 1 1-2.8-2.8l.1-.1a1.7 1.7 0 0 0 .3-1.8 1.7 1.7 0 0 0-1.5-1H3a2 2 0 0 1 0-4h.1A1.7 1.7 0 0 0 4.6 9a1.7 1.7 0 0 0-.3-1.8l-.1-.1a2 2 0 1 1 2.8-2.8l.1.1a1.7 1.7 0 0 0 1.8.3H9a1.7 1.7 0 0 0 1-1.5V3a2 2 0 0 1 4 0v.1a1.7 1.7 0 0 0 1 1.5 1.7 1.7 0 0 0 1.8-.3l.1-.1a2 2 0 1 1 2.8 2.8l-.1.1a1.7 1.7 0 0 0-.3 1.8V9a1.7 1.7 0 0 0 1.5 1H21a2 2 0 0 1 0 4h-.1a1.7 1.7 0 0 0-1.5 1z'/>")
    when "card"          then svg.("<rect x='3' y='5' width='18' height='14' rx='2'/><path d='M3 10h18'/><path d='M7 15h3'/>")
    when "library"       then svg.("<path d='M4 4h4v16H4z'/><path d='M10 4h4v16h-4z'/><path d='m16 5 3.5 1-3 14L13 19z'/>")
    when "plus"          then svg.("<path d='M12 5v14'/><path d='M5 12h14'/>")
    end
  end

end
