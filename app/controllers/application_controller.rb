class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  $markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => false)

  def login_with_cas
  	if session[:cas_user] ==
    	@current_user = User.find_by school_id: session[:cas_user]
    else
  		@current_user = User.create!(
  				school_id: session[:cas_user].to_i,
  				name: session[:cas_user],
  				password: session[:cas_user]
  			)
    end
  	#end
  end
end
