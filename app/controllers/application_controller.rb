class ApplicationController < ActionController::Base

    # capture the query param to be passed to the view
    before_action :set_user_type

    def set_user_type
        @user_type = params[:user_type]
    end

    # devise by default redirects to home page, after a login, if we need to redirect anywhere else we need to set that up in after_sign_in method
    def after_sign_in_path_for(profile)

        # if the user is a buyer and if they have a profile take them to the root path
        if(current_user.profile)
            if(params[:user][:user_type] == "buyer")
                root_path
            else
                new_listing_path
            end
        else
            # pass the user type while creating the new profile
            new_profile_path(user_type: params[:user][:user_type]) || root_path
        end
    end
    
end
