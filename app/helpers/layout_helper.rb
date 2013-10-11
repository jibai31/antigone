module LayoutHelper
  def page_title(title)
    content_for(:page_title) { title.to_s }
  end

  def header(title)
    content_for(:header) { title.to_s }
  end

  def subheader(title)
    content_for(:subheader) { title.to_s }
  end
end
