class NotesController < ApplicationController

    before_action :authenticate_user!

    def index
        @notes = current_user.notes.all.order("created_at DESC")
    end

    def show
        if Note.find(params[:id]).user == current_user
            @note = Note.find(params[:id])
        end
    end

    def new
        @note = current_user.notes.build
    end

    def create
        @note = current_user.notes.build(note_params)
        if @note.save
            redirect_to @note
            flash[:notice] = "Note Created!"
        else
            render 'new'
            flash[:alert] = "There was an error creating your Note"
        end
    end

    def edit
        if Note.find(params[:id]).user == current_user
            @note = Note.find(params[:id])
        else
            redirect_to notes_path
            flash[:notice] = "You do not own this note"
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
