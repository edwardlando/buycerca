class UserMailer < ActionMailer::Base


  def facebook_message(buyer, seller)
    mail(from: buyer.facebook_email, 
    	 to: "edwardlando8@gmail.com",
    	 subject: 'Would like to buy your item')
  end
end
