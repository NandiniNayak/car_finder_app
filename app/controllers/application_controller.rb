class ApplicationController < ActionController::Base

    # devise by default redirects to home page, after a login, if we need to redirect anywhere else we need to set that up in after_sign_in method
    def after_sign_in_path_for(profile)
        if(current_user.profile)
            new_listing_path
        else
            new_profile_path || root_path
        end
    end
    
end
