module ApplicationHelper
  def navigation
    html = ''
    case params[:controller]
    when "teams"
      html << clubsnav
      if params[:action] == "show"
        html << content_tag(:li, link_to("Team "+@team.name, url_for([@club, @team])))
      end
    when "clubs"
      html << clubsnav
    end
    return raw(html)
  end

  def clubsnav
    html = content_tag(:li, link_to("Clubs", url_for(:clubs)))
    if params[:id]
      html << content_tag(:li, link_to(@club.name, url_for(@club)))
    end
    return html
  end
end
