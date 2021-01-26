class UsersController < ApplicationController
    
    def create 
        user = User.create(user_params)
        if user.valid?
            render json: user
        else 
            render json: {errors: user.errors.full_messages},
            status: :not_acceptable
        end
    end 

    def show
        user = @currentUser
        if user
            render json: user 
        else  
            render json: {error: "Unauthorized request"}, status: :unauthorized
        end
    end
    

    private 

    def user_params 
        params.permit(:name, :email, :picture)
    end 
end
