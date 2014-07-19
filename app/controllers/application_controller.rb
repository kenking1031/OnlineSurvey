class ApplicationController < ActionController::Base

  protect_from_forgery :with => :exception

  def require_user
    if !session[:user_id]
        redirect_to login_path
    end
  end

  def convert_hash(hash)

    output=""

    hash.each do |k,v|

      output += "#{k.to_s.upcase} : #{v.map(&:inspect).join(', ')}"

    end

    output

  end

end
