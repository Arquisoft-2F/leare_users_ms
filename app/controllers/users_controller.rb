class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        users = User.all
        render json: users.as_json(root: false)
    end

    def exists
        user=User.find(params[:id])
        if user
            render json: {success:true, user:true}, status:200
        else
            render json: {success: false, message: 'User not found'}, status:400
        end
    end

    def show
        user=User.find(params[:id])
        if user
            render json: user.as_json(root: false), status:200
        else
            render json: {success: false, message: 'User not found'}, status:400
        end
    end

    def create
        user = User.new(user_params)
        # logger.debug "Article should be valid: #{user.valid?}"
        if user.save
            render json: user.as_json(root: false), status:201
        else
            render json: {success: false, message: user.errors.messages}, status:400
        end
    end

    def update
        user=User.find(params[:id])
        if user
            user.update!(edit_user_params)
            render json: user.as_json(root: false), status:200
        else
            render json: {success: false, message: user.errors.messages}, status:400
        end
    end

    def enroll
        user=User.find(params[:id])
        if user
            courses=CoursesUser.where(user_id: params[:id])
            if courses
                render json: courses.as_json(root: false), status:200
            else
                render json: {success: false, message: 'Enrollment not found'}, status:400
            end
        else
            render json: {success: false, message: 'Uer not found'}, status:400
        end    
    end

    def isenroll
        user=User.find(params[:id])
        if user
            begin
                courses=CoursesUser.find([params[:c_id],params[:id]])
                if courses
                    render json: courses.as_json(root: false), status:200
                else
                    render json: {success: false, message: 'Not enrolled'}, status:400
                end
            rescue =>e
                render json: {success: false, message: 'Not enrolled'}, status:400
            end
        else
            render json: {success: false, message: 'Unable to find user'}, status:400
        end
    end

    def destroy
        user=User.find(params[:id])
        if user
            user.destroy
            render json: user, status:200
        else
            render json: {success: false, message: 'Unable to delete User'}, status:400
        end
    end

    private

    def user_params
        params.require(:user).permit(:nickname,:name,:lastname,:picture_id, :nationality,:email,:web_site,:biography,:twitter_link,:linkedin_link,:facebook_link,:id)
    end

    def edit_user_params
        params.require(:user).permit(:nickname,:name,:lastname,:picture_id, :nationality,:email,:web_site,:biography,:twitter_link,:linkedin_link,:facebook_link)
    end

    def courses_params
        params.require(:user).permit(:c_id,:id)
    end
end
