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

    private
    def post_params
        params.require(:title)
    end

end
