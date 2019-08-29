class NotesController < ApplicationController

    def index
        @notes = Note.all.order("created_at DESC")
    end

    def show
        @note = Note.find(params[:id])
    end

    def new
        @note = Note.new
    end

    def create
        @note = Note.new(note_params)
        if @note.save
            redirect_to @note
            flash[:notice] = "Note Created!"
        else
            flash[:alert] = "There was an error creating your Note"
            render 'new'
        end
    end

    def update

    end

    def destroy

    end

    private

    def note_params
        params.require(:note).permit(:title, :content)
    end
end
