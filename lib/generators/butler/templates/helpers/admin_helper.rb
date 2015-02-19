module AdminHelper
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

  private

    def flash_class type
      { success: 'alert-success',
        error: 'alert-danger',
        alert: 'alert-info',
        notice: 'alert-info' }[type.to_sym] || type
    end
end
