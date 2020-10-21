class BlogPostController < ApplicationController
    # GET /post
    def index
        @post = BlogPost.all
        render json: @post
    end

    def show
        render json: @post
    end

    def create
        @post = BlogPost.new(post_params)
        if @post.save
            render json: {message: "Post created successfully", post: @post}, status:200
        else
            render error: {error: "error to save the post"}, status:400
        end
    end

    def update
        @post = BlogPost.find(params["id"])
        if @post
            @post.update_attributes(post_params)
            render json: {message: "Post updated successfully", post: @post}, status:200
        else
            render error: {error: "error to update the post"}, status:400
        end
    end

    def delete
        @post = BlogPost.find(params[:id])
        if @post
            @post.destroy
            render json: {message: "Post deleted successfully", post: @post}, status:200
        else
            render error: {error: "error to delete the post"}, status:400
        end
    end


    private
    def post_params
        params.require(:post).permit(:title, :statement)
    end

end
