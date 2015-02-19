module AdminHelper

  def format_datetime(date)
    return '-' unless date
    l date, format: :long_without_weekday
  end

  def flash_messages
    msg = ''
    flash.select { |key, value| key != :timedout }.each do |key, value|
      msg << <<-EOF
        <div role="alert" class="alert-dismissible alert #{flash_class(key)}">
        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        #{value}
        </div>
      EOF
    end
    msg.html_safe
  end

  def admin_active_page_class menu_item
    'active' if request.path =~ /#{menu_item}/
  end

  def sortable_table_header(translate_key, attribute, link_lambda)
    stringified_attribute = attribute.to_s
    translated_name = I18n.t("headers.#{translate_key}")
    query_param = if params[:sort_asc] == stringified_attribute
      { sort_desc: stringified_attribute }
    else
      { sort_asc: stringified_attribute }
    end
    link_to translated_name, link_lambda.call(query_param)
  end

  def boolean_icon bool
    bool == true ? fa_icon('check') : fa_icon('times')
  end

  private

    def flash_class type
      { success: 'alert-success',
        error: 'alert-danger',
        alert: 'alert-info',
        notice: 'alert-info' }[type.to_sym] || type
    end
end
