module ApplicationHelper
  def page_title
    title = "WithBooks"
    title = @page_title + ' - ' + title if @page_title
    title
  end
end
