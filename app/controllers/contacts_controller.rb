class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:success] = "Thanks for your message! We'll get back to you as soon as pawsible!"
    else
      flash.now[:error] = 'Message not sent, please try again!'
      render :new
    end
  end
end
