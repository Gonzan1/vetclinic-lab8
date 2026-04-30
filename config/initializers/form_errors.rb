ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag.start_with?('<label')
    html_tag.html_safe
  else
    if html_tag =~ /class="/
      html_tag.sub(/class="/, 'class="is-invalid ').html_safe
    else
      html_tag.sub(/(>|\s)/, ' class="is-invalid"\1').html_safe
    end
  end
end