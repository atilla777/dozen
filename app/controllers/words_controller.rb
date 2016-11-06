class WordsController < ApplicationController
  # GET /words
  # GET /words.json
  def index
    dic_ids = Dictionary.where(user_id: current_user.id).pluck(:id)
    @words = Word.all.where(dictionary_id: dic_ids)
  end

  # GET /words/1
  # GET /words/1.json
  def show
    @word = set_word
    @dictionary = @word.dictionary
  end

  # GET /words/new
  def new
    @dictionary = Dictionary.where(id: params[:dictionary_id]).first
    @word = Word.new
  end

  # GET /words/1/edit
  def edit
    @word = set_word
    @dictionary = @word.dictionary
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)
    @dictionary = @word.dictionary

    respond_to do |format|
      if @word.save
        format.html { redirect_to @dictionary, notice: 'Word was successfully created.' }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    @word = set_word
    @dictionary = @word.dictionary
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word = set_word
    dictionary = @word.dictionary
    @word.destroy
    respond_to do |format|
      format.html { redirect_to dictionary, notice: 'Word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:name, :dictionary_id, :translation)
    end
end
