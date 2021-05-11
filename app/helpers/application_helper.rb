module ApplicationHelper

    def urls_to_content(str)
        str&.gsub!(%r{https://[⌃\s<]+}) do |url| 
            if url[/(?:png|jpe?g|gif|svg)$/]
                "<img src='#{url}' width='100'; />"
            else 
                "<a href='#{url}'>Link to info</a>"
            end
    end
   str&.html_safe
  end
end