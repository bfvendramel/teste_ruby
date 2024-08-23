class CustomerUtil
  def get_customer_user(customerIdExt)
    if (!customerIdExt.nil? && customerIdExt.empty?)
      return PORTAL["user_request"]
    elsif (!customerIdExt.nil? && (customerIdExt.include? "user"))
      return PORTAL["user"]
    else
      log("implementar a busca de senha no email")
      return nil
    end
  end

  def get_customer_senha(customerIdExt)
    if (!customerIdExt.nil? && customerIdExt.empty?)
      return PORTAL["senha_request"]
    elsif (!customerIdExt.nil? && (customerIdExt.include? "user"))
      return PORTAL["senha"]
    else
      log("implementar a busca de senha no email")
      return nil
    end
  end

  #Fim da classe
end
