class ItemsController < ApplicationController

  # create the item
  def create
    item = Item.create(item_params)
    # user will create more than one, so redirect back to same page
    redirect_to :back
  end

  # whos bringing what
  def bring
    item = Item.update(params[:id], bring_params)
    if item.errors.any?
      flash[:errors] = item.errors.full_messages
      redirect_to "/show/#{item.event.id}"
    else
      redirect_to "/show/#{item.event.id}"
    end
  end

  # item and user bringing item parameters
  private
    def item_params
      params.require(:item).permit(:item, :status, :user_id, :event_id)
    end

    def bring_params
      params.require(:item).permit(:status, :user_id, :event_id)
    end
end
