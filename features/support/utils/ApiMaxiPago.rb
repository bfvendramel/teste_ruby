class ApiMaxiPago
  include HTTParty
  base_uri $base_url_request
  default_options.update(verify: false)

  def postXML(body)
    options = nil
    if defined?($sem_proxy_httparty)
      options = { :body => body, :headers => {
        "Content-Type" => "application/xml",
      } }
    else
      options = { :http_proxyaddr => $maxiProxy, :http_proxyport => $maxiPort,
                 :body => body, :headers => {
        "Content-Type" => "application/xml",
      } }
    end
    self.class.post("/UniversalAPI/postXML", options)
  end

  def postAPI(body)
    options = nil
    if defined?($sem_proxy_httparty)
      options = { :body => body, :headers => {
        "Content-Type" => "application/xml",
      } }
    else
      options = { :http_proxyaddr => $maxiProxy, :http_proxyport => $maxiPort,
                 :body => body, :headers => {
        "Content-Type" => "application/xml",
      } }
    end
    self.class.post("/UniversalAPI/postAPI", options)
  end

  def postReport(body)
    options = nil
    if defined?($sem_proxy_httparty)
      options = { :body => body, :headers => {
        "Content-Type" => "application/xml",
      } }
    else
      options = { :http_proxyaddr => $maxiProxy, :http_proxyport => $maxiPort,
                 :body => body, :headers => {
        "Content-Type" => "application/xml",
      } }
    end
    self.class.post("/ReportsAPI/servlet/ReportsAPI", options)
  end
end
