class Public::ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact, current_user).deliver
      redirect_to root_path, notice: 'お問い合わせありがとうございます。お問い合わせ内容の送信が完了しました。'
    else
      render :new
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:content)
  end
  
end
