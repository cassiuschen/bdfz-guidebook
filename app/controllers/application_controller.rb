class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :better_time
  $markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => false)

  $admin = %w(1423101 F0000Q1207 F0000L0011)
  def is_admin?
  	if $admin.include?session[:cas_user].upcase
    	session[:admin] = true
    else
  		session[:admin] = false
    end
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

  #def logout
  #	reset_session
  #  CASClient::Frameworks::Rails::Filter.logout(self)
  #end
end
