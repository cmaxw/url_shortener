class RedirectionsController < ApplicationController
  # GET /redirections/1 or /redirections/1.json
  def show
    @redirection = Redirection.find_by(source_path: params[:source_path])
  end

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
