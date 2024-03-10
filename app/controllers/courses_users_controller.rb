class CoursesUsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        courses = CoursesUser.all
        render json: courses.as_json(root: false), status:200
    end

    def show
        enroll=CoursesUser.where(course_id:params[:id])
        if enroll.length>0
            render json: enroll.as_json(root: false), status:200
        else
            render json: {success: false, message: 'Unable to get courses'}, status:400
        end
    end

    def students
        users = User.joins(:courses_users).select(User.attribute_names-["created_at","updated_at"],CoursesUser.attribute_names-["user_id"])
        # users = User.joins(:courses_users).where(courses_users:{course_id:params[:c_id]})
        render json: users.as_json(root: false), status:200
    end

    def create
        enroll = CoursesUser.new(params_create_enroll)
        if enroll.save
            render json: enroll.as_json(root: false), status:201
        else
            render json: {error: 'Unable to enroll user in the course'}, status:400
        end  
        # # logger.debug "Article should be valid: #{user.valid?}"  
    end

    def modify
        enroll=CoursesUser.find([params[:c_id],params[:id]])
        if enroll
            enroll.update!(edit_enroll_params)
            render json: enroll.as_json(root: false), status:200
        else
            render json: {success: false, message:'Unable to find enrollment'}, status:400
        end
    end

    def remove
        enroll=CoursesUser.find([params[:c_id],params[:id]])
        if enroll
            enroll.destroy
            render json: enroll, status:200
        else
            render json: {error: 'Unable to leve the course'}, status:400
        end
    end

    private

    def edit_enroll_params
        params.require(:courses_user).permit(:progress,:score,:last_seen)
    end

    def params_create_enroll
        params.require(:courses_user).permit(:course_id,:user_id)
    end
end
