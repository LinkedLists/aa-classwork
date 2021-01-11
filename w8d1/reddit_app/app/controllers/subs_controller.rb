class SubsController < ApplicationController
    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new
        @sub.user_id = params[:user_id]
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end
