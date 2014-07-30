class Api::V1::BookController < Api::V1::BaseController
  def get_list
    render json: Book.all.sort_by{|a| a.id}.map{|b| {title: b.title, id: b.id, version: better_time(b.last_updated_at)}}
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

  def info
    book = Book.where("id = ?", info_params).last
    json = {
      title: book.title,
      version: better_time(book.last_updated_at)
    }
    render json: json
  end

  def update
    book = Book.where("id = ?", info_params).last
    book.update_attributes update_params
    if book.save
      render json: {status: 'success'}
    else
      render json: {status: 'error'}
    end
  end

  def new
    b = Book.new(new_params)
    if b.save
      render json: {status: "success"}
    else
      render json: {status: "error"}
    end
  end

  private
  def info_params
    params[:id].to_i
  end

  def update_params
    params.require(:book).permit(:title, :id)
  end

  def new_params
    params.require(:book).permit(:title, :id)
  end
end