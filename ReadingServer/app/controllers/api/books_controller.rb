class Api::BooksController < ApiController
  def index
    filter = params['filter']

    if filter == 'reading' || filter == 'drifting'
      @books = Book.where(status: filter).order_by(:updated_at.desc)
      render status: :ok
    else
      render status: :not_acceptable, json: {mssage: 'Field filter should be either reading or drifting'}
    end
  end

  def show
    @book = Book.find(params[:id])
    if @book
      render status: :ok
    else
      render status: :not_found, json: {message: 'Book not exists'}
    end
  end

  def owe_book
    user = User.find(params[:user_id])
    if user
      @books = Book.where(owner: user).order_by(:updated_at.desc)
      render status: :ok
    else
      render status: :not_found, json: {message: 'User not found'}
    end
  end

  def hold_book
    user = User.find(params[:user_id])
    if user
      @books = Book.where(holder: user).and(status: 'reading').order_by(:updated_at.desc)
      render status: :ok
    else
      render status: :not_found, json: {message: 'User not found'}
    end
  end

  def drop_book
    user = User.find(params[:user_id])
    if user
      @book = Book.create({
                              name: params['name'],
                              summary: params['summary'],
                              author: params['author'],
                              image: params['image'],
                              doubanid: params['doubanid'],
                              status: 'drifting',
                              holder: user,
                              owner: user
                          })
      render status: :created
    else
      render status: :Unauthorized, json: {message: 'User authorized failed'}
    end

  end

end
