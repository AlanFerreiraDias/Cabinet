class DocumentsController < ApplicationController
    before_action :find_document, only: [:show, :edit, :update, :destroy]

    def index
        @docs = Document.all.order("created_at DESC")
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
        if @doc.update(document_params)
            redirect_to @doc
        else
            render 'edit'
        end
    end

    def destroy
        @doc.destroy
        redirect_to documents_path
    end

    private

        def find_document
            @doc = Document.find(params[:id])
        end

        def document_params
            params.require(:document).permit(:title, :content)
        end
end
