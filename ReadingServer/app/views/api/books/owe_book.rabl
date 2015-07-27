collection @books

node(:id) {|b| b.id.to_s}
attribute :name, :author, :summary, :status, :image
child(address: :address) do |a|
    attribute :latitude, :longitude, :province, :city, :street
end