class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    prototype = Prototype.new(prototype_params)
    if prototype.save
      # flash[:success] = "Prototype successfully created"
      redirect_to root_path
    else
      # flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
    if @prototype.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    prototype = Prototype.find(params[:id])
      if prototype.update(prototype_params)
        # flash[:success] = "Prototype was successfully updated"
        redirect_to prototype_path(params[:id])
      else
        # flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.destroy
      # flash[:success] = 'Prototype was successfully deleted.'
      redirect_to root_path
    else
      # flash[:error] = 'Something went wrong'
      render "show"
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end