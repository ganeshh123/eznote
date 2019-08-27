class NotesController < ApplicationController

    def index

    end

    def show

    end

    def new
        @note = Note.new
    end

    def create
        @note = Note.new(note_params)
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
