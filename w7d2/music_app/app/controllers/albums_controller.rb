class AlbumsController < ApplicationController

    def new
        if Band.find_by(id: params[:band_id])
            render :new
        else
            # flash.now[:errors].error.full_messages
            flash[:errors] = ["Band ID does not exist"]
            redirect_to albums_url
        end
    end

end
