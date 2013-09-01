module ApplicationHelper

  def draw_errors object
    rsl = ""
    if object.errors.any?
      rsl << %(<div class = "alert alert-error">)
      rsl << %(<button class="close" type="button" data-dismiss="alert">&times;</button>)
      rsl << %(<strong>#{t("labels.error_save", :count => object.errors.count)}:</strong>)
      rsl << %(<ul>)
      object.errors.full_messages.each do |msg|
        rsl << %(<li>#{msg}</li>)
      end
      rsl << %(</ul></div>)
    end
    rsl.html_safe
  end

  def draw_flash_messages
    rsl = ""
    if flash[:notice]
      rsl << %(<div class="alert alert-success"><button class="close" type="button" data-dismiss="alert">&times;</button>#{flash[:notice]}</div>)
    end
    if flash[:alert] or params[:alert]
      rsl << %(<div class="alert alert-error"><button class="close" type="button" data-dismiss="alert">&times;</button>#{flash[:alert] || params[:alert]}</div>)
    end
    flash.discard
    rsl.html_safe
  end

end
