object @book

node(:id) {|b| b.id.to_s}
attribute :name, :author, :summary, :status, :image
child(address: :address) do |a|
    attribute :latitude, :longitude, :province, :city, :street
end
child(owner: :owner) do |o|
    node(:id) {|o| o.id.to_s}
    attribute :username, :avatar, :email
end
child(holder: :holder) do |h|
    node(:id) {|o| o.id.to_s}
    attribute :username, :avatar, :email
end