=begin
    To get Rails do something, at minimun, we need to create a 'controller' and a 'view'.

    A controller's purpose is to receive specific requests for the application. Routing decides
    which controller receives which requests. Often there is more than one route to each
    controller, and different routes  can be served by different actions. Each action's purpose
    is to collect information to provide it to a view.

    A view's purpose is to display this information in a human readable form. An important
    distinction is that is the controller, not the view, where information is collected.
    The view should just display that information. By default, view templates are written
    in a language called eRuby (Embedded Ruby) which is processed by the request cycle
    in Rails before being sent to the user.

# A resource is the term used for a collection of similar objects, such as articles, people,
  # animals. You can Create/Read/Update/Destroy items for a resource and these
  # operations are referred to as CRUD operations.
  # Rails provides a 'resources' method which can be used to declare a standard REST
  # resource. In our case, we are working with the resource 'article'.
=end

class ArticlesController < ApplicationController

    http_basic_authenticate_with name: "alegooner", password: "12345", except:
[:index, :show]

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end

