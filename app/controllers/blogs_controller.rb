class BlogsController < ApplicationController
	def create
		@blogs = Blog.new(blog_params)
		@blogs.save
		if @blogs.save
		render 'index'
		else
		render 'feedback'
		end
	end
	def feedback
	end
	def blog_params
		params.require(:blogs).permit(:name,:email,:message)
	end
	def index
	end
	def show
	end
	def student
	end
	def ruby
	end
	def rails
	end
	def c
	end
	def java
	end
	def index
	end
	def new
	end
end
