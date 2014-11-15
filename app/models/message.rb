class Message < ActiveRecord::Base
  has_many :children, class_name: "Message", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Message"

  paginates_per 5
end
