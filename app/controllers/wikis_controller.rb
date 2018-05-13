class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
     @wiki = Wiki.new(wiki_params)


     if @wiki.save
       redirect_to @wiki, notice: "The wiki was saved successfully."
     else
       flash.now[:alert] = "Error creating topic. Please try again."
       render :new
     end
   end

  def edit
    @wiki = Wiki.find(params[:id])
  end


  private

  def wiki_params
    params.require(:wiki).permit(:title,:body,:private)
  end
end
