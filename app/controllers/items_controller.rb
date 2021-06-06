class ItemsController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token
    before_action :find_item, only: %i[show edit update destroy upvote]
    before_action :admin?, only: %i[edit]
    after_action :show_info, only: %i[index]
    

    def index
        @item = Item.all.order(:id)
       # @items = @items.where('price >= ?', params[:price_from])       if params[:price_from]
        #@items = @items.where('created_at >= ?', 1.day.ago)            if params[:today_at]
        #@items = @items.where('votes_count >= ?', params[:votes_from]) if params[:votes_from]
        #@items = @items.order(:id)
        #@items = @items.includes(:image)
        # @items= Item.all.order('votes_count DESC','price').limit 10
        #@items= Item.where('price >= ?', params[:price_from])
    end

    def create
       @item = Item.create(items_params)
        if @item.persisted?
            flash[:success] = "Item was saved"
            redirect_to items_path
        else 
            flash.now[:error] = "Please fill all fields correctly"
            render :new
        end
    end
    
    def new
        @item= Item.new
    end
     def show; end
     def edit; end

    def update 
    if @item.update(items_params)
        flash[:success] = "Item was successfully updated"
        redirect_to items_path
      else 
        flash.now[:error] = "Please fill all fields correctly"
        render json: item.errors, status: :unprocessable_entity
      end 
    end

    def destroy 
        if @item.delete.destroyed?
            flash[:success] = "Item was deleted"
            #render json: { success: true }
            redirect_to items_path
        else 
            flash[:error] = "Item wasn't deleted"
            render json: item.errors, status: :unprocessable_entity
        end
    end

    def upvote
    @item.increment! :votes_count
    redirect_to items_path
    end

    def expensive
        @item = Item.where("price > 50")
        render :index
    end 

    private
    def items_params
        params.require(:item).permit(:name, :price, :description)
    end

    def find_item
        @item = Item.where(id: params[:id]).first
        render_404 unless @item
    end

    def show_info
        puts 'Index endpoint'
    end

end
