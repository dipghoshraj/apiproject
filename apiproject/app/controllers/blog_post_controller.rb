class BlogPostController < ApplicationController
    # GET /posts
    def index
        @post = BlogPost.all
        render json: @post
    end

    # GET /posts/1
    def show
        @post = BlogPost.find(params[:id])
        if @post
            render json: @post
        else
            render error:{message: "Post not found"}, status:404
        end
    end

    def create
        # if params[:title] != nil
        @post = BlogPost.new(post_params)
        if @post.errors.blank? && @post.save
            render json: {message: "Post created successfully", id: @post.id}, status:201
        else
            render json: {message: "title or statement should not null or less than 3 characters"}, status:400
        end
        # else
        #     render json: {json: "error to save the post"}, status:400
        # end
    end

    def update
        @post = BlogPost.find(params["id"])
        if @post.errors.blank?
            @post.update_attributes(post_params)
            if @post.errors.blank?
                render json: {message: "Post updated successfully", post: @post.id}, status:200
            else
                render json: {message: "title or statement should not null or less than 3 characters"}, status:400
            end
        else
            render json: {message: "no post to update"}, status:400
        end
    end

    def delete
        @post = BlogPost.find(params[:id])
        if @post
            @post.destroy
            render json: {message: "Post deleted successfully", post: @post}, status:200
        else
            render error: {error: "no such post for delet"}, status:404
        end
    end


    private
    def post_params
        params.require(:post).permit(:title, :statement)
    end
end
