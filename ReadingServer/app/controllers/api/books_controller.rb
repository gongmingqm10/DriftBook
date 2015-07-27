class Api::BooksController < ApiController
  def index
    filter = params['filter']

    if filter == 'reading' || filter == 'drifting'
      @books = Book.where(status: filter)
      render status: :ok
    else
      render status: :not_acceptable, json: {mssage: 'Field filter should be either reading or drifting'}
    end
  end

  def owe_book
    user = User.find(params[:user_id])
    if user
      @books = Book.where(owner: user)
      render status: :ok
    else
      render status: :not_found, json: {message: 'User not found'}
    end
  end

  def hold_book
    user = User.find(params[:user_id])
    if user
      @books = Book.where(holder: user)
      render status: :ok
    else
      render status: :not_found, json: {message: 'User not found'}
    end
  end

  def drop_book

  end

end
