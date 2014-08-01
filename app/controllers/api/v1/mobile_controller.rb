class Api::V1::MobileController < Api::V1::BaseController
  def last_update
    @time = Article.all.map{|a| a.updated_at}.max
    render json: {version: better_version(@time)}
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


  private
  def info_params
    params[:id].to_i
  end

  def update_params
    params.require(:article).permit(:title, :order, :content)
  end

  def new_params
    params.require(:article).permit(:title, :order, :content)
  end
end