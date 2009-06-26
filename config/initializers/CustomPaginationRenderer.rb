class CustomPaginationRenderer < WillPaginate::LinkRenderer
  @@id = 1
  def to_html
    links = @options[:page_links] ? windowed_links : []
    # previous/next buttons
    links.unshift page_link_or_span(@collection.previous_page, 'disabled', @options[:prev_label])
    links.push    page_link_or_span(@collection.next_page,     'disabled', @options[:next_label])
    html = links.join(@options[:separator])
    html += goto_box
    @options[:container] ? @template.content_tag(:div, html, html_attributes) : html
  end
  private
  
  def goto_box
    @@id += 1
    @@id = 1 if @@id > 100
  <<-GOTO
    <input type="text" maxlength="5" size="3" id="page#{@@id}" />
    <input type="submit" onclick="goto_page#{@@id}()" value="跳转"/>
    <script type="text/javascript">
      function goto_page#{@@id}()
      {
        page = Number($('page#{@@id}').value)
        total = #{total_pages}
        if(page < 1 || page > total)
        {
          alert('请输入 1 ~ ' + total + ' 之间的数字!')
          return;
        }
        var link = '#{@template.url_for(url_options("_page"))}'
        var new_link = link.replace("_page", page)
        window.location.assign(new_link)
      }
    </script>
    GOTO
  end
end