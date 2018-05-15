class WikisController < ApplicationController

  def index
    @wikis = Wiki.all
    authorize @wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
     @wiki = current_user.wikis.new(wiki_params)


     if @wiki.save
       redirect_to @wiki, notice: "The wiki was saved successfully."
     else
       flash.now[:alert] = "Error creating article. Please try again."
       render :new
     end
   end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update

     @wiki = Wiki.find(params[:id])


     if @wiki.update(wiki_params)
       redirect_to @wiki, notice: "The wiki was saved successfully."
     else
       flash.now[:alert] = "Error creating article. Please try again."
       render :new
     end
   end

   def destroy
     @wiki = Wiki.find(params[:id])

     if @wiki.destroy
       flash[:alert] = "The article has been destroyed"
     else
       flash[:notice] = "Unable to delete the article"
     end

     redirect_to root_path
   end


  private

  def wiki_params
    params.require(:wiki).permit(:title,:body,:private)
  end
end
