class DocumentsController < ApplicationController
    before_action :find_document, only: [:show, :edit, :update, :destroy]

    def index
        @docs = Document.where(user_id: current_user)
    end

    def show
    end

    def new
        @doc = current_user.documents.build
    end

    def create
        @doc = current_user.documents.build(document_params)

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
