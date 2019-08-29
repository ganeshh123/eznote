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
            render 'new'
            flash[:alert] = "There was an error creating your Note"
        end
    end

    def update
        @note = Note.find(params[:id])
        if @note.update(note_params)
            redirect_to @note
            flash[:notice] = "Note Updated!"
        else
            render 'edit'
            flash[:alert] = "There was an error updating the Note"
        end
    end

    def destroy
        @note = Note.find(params[:id])
        if @note.destroy
            redirect_to notes_path
            flash[:notice] = "Note Deleted!"
        else
            render 'show'
            flash[:alert] = "There was an error deleting the Note"
        end
    end

    private

    def note_params
        params.require(:note).permit(:title, :content)
    end
end
