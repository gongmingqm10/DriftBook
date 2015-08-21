collection @conversations

child(user: :user) do |s|
    node(:id) {|s| s.id.to_s}
    attribute :username, :avatar, :email
end

child(messages: :messages) do |m|
    node(:id) {|m| m.id.to_s}
    attribute :content
    child(sender: :sender) do |s|
        node(:id) {|s| s.id.to_s}
        attribute :username, :avatar, :email
    end
    child(receiver: :receiver) do |s|
        node(:id) {|s| s.id.to_s}
        attribute :username, :avatar, :email
    end
end