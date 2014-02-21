module ApplicationHelper
  def abbr_timeago(time, options = {})
    options[:class]
    options[:class] = options[:class].blank? ? "timeago" : [options[:class],"timeago"].join(" ")
    content_tag(:abbr, "", options.merge(:title => time.iso8601)) if time
  end

  def better_time(time)
    t = time.to_s
    p = /(....)-(..)-(..)/ 
    p.match(t)
    year = $1.to_i
    month = $2.to_i
    day = $3.to_i
    "#{year}年#{month}月#{day}日"
  end

  def better_version(time)
    t = time.to_s
    p = /(....)-(..)-(..)/ 
    p.match(t)
    year = $1.to_i
    month = $2.to_i
    "#{year}年#{month}月"
  end

  def timeago(time, options = {})
    options[:class]
    options[:class] = options[:class].blank? ? "timeago" : [options[:class],"timeago"].join(" ")
    content_tag(:div, "", options.merge(:title => time.iso8601)) if time
  end

  def span_timeago(time, options = {})
    options[:class]
    options[:class] = options[:class].blank? ? "timeago" : [options[:class],"timeago"].join(" ")
    content_tag(:span, "", options.merge(:title => time.iso8601)) if time
  end

  def page_title
    if @article
      @title = @article.title
    end
    if @title
      @title + " | 学生手册"
    else
      "学生手册"
    end
  end
end