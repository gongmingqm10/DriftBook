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
      render status: :unauthorized, json: {message: 'User authorized failed'}
    end

  end

  def update_status
    status = params[:status]
    user = User.find(params[:user_id])
    @book = Book.find(params[:id])

    return render status: :not_found, json: {message: 'User authorization failed'} unless user
    return render status: :not_found, json: {message: 'Book not found'} unless @book

    if status == 'drifting'
      # 转漂
      if user.id.to_s == @book.holder.id.to_s
        Event.create({content: '转漂', category: 'drift', location: @book.address, user: user, book: @book})

        @book.status = status
        @book.save!
        render status: :ok
      else
        # 用户不能转漂别人的图书
        render status: :unauthorized, json: {message: 'You have no access to drift other holder\'s book'}
      end
    elsif status == 'reading'
      # 求漂
      if @book.status == 'drifting'
        Message.create({sender: user, receiver: @book.holder, content: "我想读《#{@book.name}》, 请转交给我，谢谢 :)"})
        Event.create({content: '求漂', category: 'drift', location: user.address, user: user, book: @book})

        @book.status = status
        @book.holder = user
        @book.save!
        render status: :ok
      else
        # 图书已被借走或被收回
        render status: :bad_request, json: {message: 'Book has already been token, you\'re late'}
      end
    elsif status == 'stop'
      if user.id.to_s == @book.owner.id.to_s
        Message.create({sender: user, receiver: @book.holder, content: "我需要收回《#{@book.name}》, 请归还给我，谢谢 :)"})
        Event.create({content: '收漂', category: 'drift', location: user.address, user: user, book: @book})

        @book.status = status
        @book.save!

        render status: :ok
      else
        # 用户没权限结束别人的图书
        render status: :unauthorized, json: {message: 'You have no right to get back other\'s book'}
      end
    else
      render status: :bad_request, json: {message: "Params status can not be #{status}"}
    end
  end

end
