class RedirectionsController < ApplicationController
  before_action :set_redirection, only: %i[show edit update destroy]

  # GET /redirections/1 or /redirections/1.json
  def show; end

  # GET /redirections/new
  def new
    @redirection = Redirection.new
  end

  # POST /redirections or /redirections.json
  def create
    @redirection = Redirection.new(redirection_params)

    if @redirection.save
      redirect_to new_redirection_url,
                  notice: "Redirection with slug '#{@redirection.source_path}' was successfully created redirecting to '#{@redirection.destination_url}."
    else
      render :new, notice: 'here', status: :unprocessable_entity
    end
  end

  # PATCH/PUT /redirections/1 or /redirections/1.json
  def update
    respond_to do |format|
      if @redirection.update(redirection_params)
        format.html { redirect_to redirection_url(@redirection), notice: 'Redirection was successfully updated.' }
        format.json { render :show, status: :ok, location: @redirection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @redirection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /redirections/1 or /redirections/1.json
  def destroy
    @redirection.destroy!

    respond_to do |format|
      format.html { redirect_to redirections_url, notice: 'Redirection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_redirection
    @redirection = Redirection.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def redirection_params
    params.require(:redirection).permit(:source_path, :destination_url)
  end
end
