module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to(repo, "https://github.com/#{ author }/#{ repo }")
  end

  def flash_messages
    html = ''
    flash.each { |key, value| html << content_tag(:p, value, class: "flash #{key}") }
    html.html_safe
  end
end
