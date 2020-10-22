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
        @post = BlogPost.new(post_params)
        if @post.valid?&& @post.errors.blank?
            render json: {message: "Post created successfully"}, status:201
        else
            render error: {error: "error to save the post"}, status:500
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
            render error: {error: "no such post for delet"}, status:404
        end
    end


    private
    def post_params
        params.require(:post).permit(:title, :statement)
    end

end
