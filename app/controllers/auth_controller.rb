class AuthController < ApplicationController
  def logout
  	uri = URI.parse(self.request.referer)
    root_url = uri.scheme.to_s + '://' + uri.host.to_s + ':' + uri.port.to_s
    RubyCAS::Filter.logout(self, root_url)
  end
end
