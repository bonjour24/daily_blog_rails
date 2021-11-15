class AuthorsController < ApplicationController

  def home
    
  end
  
  def index
    @authors=Author.all
  end

  def new 
    @author=Author.new
  end

  def show
    @author=Author.find(params[:id])
  end 

  def create
    @author=Author.new(author_params)
    if @author.save
      redirect_to @author
    else 
      render :new
    end
  end

  def edit
    @author=Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to @author
    else
      render :edit
    end
  end

  def destroy
    @author=Author.find(params[:id])
    @author.destroy

    redirect_to root_path
  end


  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname, :lastname, :age, :email, :password, :password_confirmation) }
    end
 
    def author_params
      params.require(:author).permit(:firstname, :lastname,:age)
    end

end
