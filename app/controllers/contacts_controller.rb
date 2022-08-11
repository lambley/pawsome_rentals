class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :message, :captcha)
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      flash.now[:success] = "Thanks for your message! We'll get back to you as soon as pawsible!"
    else
      flash.now[:error] = 'Message not sent, please try again!'
      render 'contacts/new'
    end
  end
end
