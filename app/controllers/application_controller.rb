class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  $markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => false)

  $admin = %w(1423101 F006178051 F0000Q1207 F0000L0011 F0000Q1475)
  def is_admin?
  	if $admin.include?session[:cas_user].upcase
    	session[:admin] = true
    else
  		session[:admin] = false
    end
  end

  def logout
  	reset_session
    CASClient::Frameworks::Rails::Filter.logout(self)
  end
end
