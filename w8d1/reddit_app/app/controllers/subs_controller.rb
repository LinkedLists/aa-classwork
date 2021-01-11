class SubsController < ApplicationController
    before_action :require_logged_in, only: [:new, :create]
    before_action :require_is_moderator, only: [:update]

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.user_id = params[:sub][:user_id]
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find_by_id(params[:id])
        render :edit
    end

    def update
        @sub = Sub.find_by_id(params[:id])
        if @sub
            if @sub.update(sub_params)
                redirect_to sub_url(@sub)
            else
                flash.now[:errors] = @sub.errors.full_messages
                render :edit
            end
        else
            flash[:errors] = ["Sub could not be found"]
            render :edit
        end
    end

    def show
        @sub = Sub.find_by_id(params[:id])
        render :show
    end

    def index
        @subs = Sub.all
        render :index
    end

    def require_is_moderator
        unless current_user.id == Sub.find_by_id(params[:id]).user_id
            flash[:errors] = ["Sub can only be edited by the moderator"]
            redirect_to subs_url
        end
    end

    private

    def sub_params
        params.require(:sub).permit(:title, :description, :user_id)
    end
end
