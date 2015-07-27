object @book

node(:id) {|b| b.id.to_s}
attribute :name, :author, :summary, :status, :image