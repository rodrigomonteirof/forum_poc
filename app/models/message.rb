class Message < ActiveRecord::Base
  has_many :children, class_name: "Message", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Message"

  paginates_per 5

  before_save :check_blacklist

  def blacklisted?
    self.blacklist
  end

  def check_blacklist
    if Blacklist.blacklisted?(self.text)
      self.blacklist = true
      self.blacklist_text = Blacklist.replace_words(self.text)
    else
      self.blacklist = false
      self.blacklist_text = ''
    end

    true
  end
end
