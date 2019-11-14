class ItemsController < ApplicationController
	before_action :set_item, except: [:index,:new,:create]
	before_action :set_department
	def show
		
  end

	def index
		@items = @department.items
	end

	def new
		@item = @department.items.new
		render partial: "form"
	end

	def create
		@item = @department.items.new(item_params)
		if @item.save
			redirect_to department_path(@department)
		else
			render :new
		end
	end

	def edit 
		render partial: "form"
	end

	def update
		if @item.update(items_params)
			redirect_to item_path(@item)
		else
			render :edit
		end
	end

	def destroy
		@item.destroy
		 redirect_to department_path(@department)
	end

	private
		def set_item
			@item = Item.find(params[:id])
		end

		def set_department
			@department = Department.find(params[:department_id])
		end

		def item_params
			params.require(:item).permit(:name,:description,:price)
		end
	
end
