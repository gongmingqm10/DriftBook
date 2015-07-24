class Api::BooksController < ApiController
  def index
    filter = params["filter"]

    if filter == "reading" || filter == "drifting"
      @books = Book.where(status: filter)
      render status: :ok
    else
      render status: :not_acceptable, json: {mssage: "Field filter should be either reading or drifting"}
    end
  end

end
