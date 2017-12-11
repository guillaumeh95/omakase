class EmailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject}"
    message.to = [ 'guigui.ht@wanadoo.fr' ]
  end
end
