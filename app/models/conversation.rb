class Conversation < ApplicationRecord
    # add_index :conversations, [:recipient_id, :sender_id], unique: true
    has_many :messages, dependent: :destroy
<<<<<<< HEAD
    belongs_to :sender, foreign_key: :sender_id, class_name: User
    belongs_to :recipient, foreign_key: :recipient_id, class_name: User
  
    validates :sender_id, uniqueness: { scope: :recipient_id }
  
    def opposed_user(user)
      user == recipient ? sender : recipient
    end
=======
    belongs_to :sender, foreign_key: :sender_id, class_name: "User"
    belongs_to :recipient, foreign_key: :recipient_id, class_name: "User"
  
    validates :sender_id, uniqueness: { scope: :recipient_id }
    
    scope :between, -> (sender_id, recipient_id) do
        where(sender_id: sender_id, recipient_id: recipient_id).or(
          where(sender_id: recipient_id, recipient_id: sender_id)
        )
    end

    def self.get(sender_id, recipient_id)
        conversation = between(sender_id, recipient_id).first
        return conversation if conversation.present?

        create(sender_id: sender_id, recipient_id: recipient_id)
    end
    
      
    def opposed_user(user)
      user == recipient ? sender : recipient
    end

    def close
        @conversation = Conversation.find(params[:id])
    
        session[:conversations].delete(@conversation.id)
    
        respond_to do |format|
          format.js
        end
    end
>>>>>>> bug_fix
end
