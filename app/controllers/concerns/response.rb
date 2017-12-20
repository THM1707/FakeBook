# render json for object with status
module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end