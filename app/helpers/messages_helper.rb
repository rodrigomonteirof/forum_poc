module MessagesHelper

  def tree(message)

    output = render 'message_template', message: message

    if message.children.present?
      message.children.each do |child|
        output += tree(child)
      end
    end

    output
  end

  def title(message)
    if message.parent.present?
      "#{message.id} (filho de #{message.parent.id})"
    else
      "#{message.id}"
    end
  end

  def safe_text(message)
    if message.blacklisted?
      message.blacklist_text
    else
      message.text
    end
  end
end
