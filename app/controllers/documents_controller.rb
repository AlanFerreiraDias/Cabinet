class DocumentsController < ApplicationController
    def index
    end

    def show
    end

    def new
        @doc = Document.new
    end

    def create
        @doc = Document.new(document_params)

        if @doc.save
            redirect_to @doc
        else
            render 'new'
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

        def find_document
        end

        def document_params
            params.require(:document).permit(:title, :content)
        end
end
