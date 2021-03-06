module ErrorHandling
  extend ActiveSupport::Concern

  BAD_REQUEST_ERRORS = [
    NetflixJsonapiExample::JsonApiError
  ]

  included do
    rescue_from(*BAD_REQUEST_ERRORS) do |error|
      respond_with_error(400, error)
    end

    rescue_from NetflixJsonapiExample::UnauthorizedError do
      respond_with_error(401, 'Not authorized')
    end

    rescue_from NetflixJsonapiExample::RecordNotFoundError do
      respond_with_error(404, 'Record not found')
    end

    rescue_from JsonApi::Request::MediaTypeError do
      respond_with_error(406, 'Invalid request media type. Are you using JSONAPI standard?')
    end
  end
end
