class UsersController < ApplicationController
    
    def create 
        user = User.create(user_params)

        render json: user
    end 

    def show
        user = User.last
        if user
            render jons: user 
        else  
            render json: {error: "Unauthorized request"}, status: :unauthorized
        end
    end
    

    private 

    def user_params 
        params.permit(:name, :email, :picture)
    end 
end
