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
child(events: :events) do
    node(:id) {|e| e.id.to_s}
    attribute :content
    child(user: :user) do
        node(:id) {|u| u.id.to_s}
        attribute :username, :email
    end
    child(location: :address) do
        attribute :longitude, :latitude, :city, :province, :street
    end
end