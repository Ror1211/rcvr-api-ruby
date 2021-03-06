require 'jimson'

class IrisController
  extend Jimson::Handler

  def createDataRequest(params)
    Rails.logger.debug("Request from IRIS: #{params["dataRequest"]}")
    c_id = "6e69ea48-7eb7-42fa-a876-84e409cb5505"
    c_id = params["dataRequest"]["locationId"] if Rails.env.production? || Rails.env.test?

    company = Company.find(c_id)
    CreateDataRequest.call(
      company: company,
      from: params["dataRequest"]["start"],
      to: params["dataRequest"]["end"],
      reason: params["dataRequest"]["requestDetails"],
      iris_client_name: params["_client"]["name"],
      iris_data_authorization_token: params["dataRequest"]["dataAuthorizationToken"],
      iris_connection_authorization_token: params["dataRequest"]["connectionAuthorizationToken"],
      proxy_endpoint: params["dataRequest"]["proxyEndpoint"]
    )

    {"_" => "OK"}
  rescue => error
    {"_" => "ERROR: #{error.message}"}
  end
end