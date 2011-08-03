module ApplicationHelper
    def parse_datetime(time)
    time.strftime("%Y-%m-%d <br/> %X") if time
  end

  def parse_date(date)
    date.strftime("%Y-%m-%d") if date
  end

  def  per_page_select_tag(name, option_tags = nil, selected = nil , options = {})
    if options[:id].blank?
      options[:id] = 'per_page_select'
    end
    if options[:onchange].blank?
      options[:onchange] = "$('per_page').value = this.value ;$('search').submit();"
    end
    if option_tags.blank?
      option_tags = options_for_select([[t('select.per_page_select_50'), '50'],[t('select.per_page_select_100'), '100'],[t('select.per_page_select_200'), '200'],[t('select.per_page_select_500'), '500']],  selected)
    end
    select_tag(name ,option_tags ,options)
  end
  def hbr(str)
    str = html_escape(str)
    str.gsub(/\r\n|\r|\n/, "<br />")
  end

  def is_public_text(is_public)
    if is_public
#      "是"
    else
#      "否"
    end
  end

end
