class Admin::ContactsController < ApplicationController
  
  def index
    if params[:responded]=="false"
      @contacts = Contact.where(responded: false).page(params[:page])
    else
      @contacts = Contact.page(params[:page])
    end
  end
  
  def update
    @contact = Contact.find(params[:id])
    if @contact.update(responded: true)
      redirect_to admin_contacts_path
    else  
      render 'index'
    end
  end
  
end
