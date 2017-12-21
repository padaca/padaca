class Nachricht < ActiveRecord::Base
  belongs_to :sender, class_name: "Account"
  belongs_to :empfaenger, class_name: "Account"
  validates :sender, presence: true
  validates :empfaenger, presence: true
end
