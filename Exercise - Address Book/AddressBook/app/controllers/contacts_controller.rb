class ContactsController < ApplicationController
  def index
    @contacts = Contact.all.order('name ASC')
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new contact_params 
    if @contact.save 
      redirect_to '/'
    else
      redirect_to '/contacts/new'
    end
    # contact = Contact.new(
    #   :name => params[:contact][:name],
    #   :address => params[:contact][:address],
    #   :phone => params[:contact][:phone],
    #   :email => params[:contact][:email],
    #   :image => params[:contact][:image])

    # contact.save

    # redirect_to("/contacts")
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def favorite
    contact = Contact.find(params[:contact][:id])
    contact.favorite = true
    contact.save

    redirect_to("/contacts")
  end

  def search_name
    @search = params[:contact][:name]
    @contacts = Contact.where("name LIKE ?", "#{@search}%")

    render "search"
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :address,:phone,:email,:image)
  end
end
