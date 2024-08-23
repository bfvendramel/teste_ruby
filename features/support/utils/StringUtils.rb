class StringUtils
  def extrair_4_ultimos_digitos_cartao(numero_cartao)
    if (numero_cartao.size > 4)
      return numero_cartao.slice((numero_cartao.size - 4)..(numero_cartao.size))
    end
    return numero_cartao
  end

  # Converte um formato de data passado para outro formato de data desejado
  def converter_StringDate_em_formato_desejado(my_date, format_atual, format_desejado)
    date_obj = Date.strptime(my_date, format_atual)
    return date_obj.strftime("%d/%m/%Y")
  end

  def deParaDeFrequencia(dataPrimeiroPagamento)
    resposta = nil
    case dataPrimeiroPagamento
    when "daily"
      resposta = "D"
    end
    return resposta
  end

  def obter_nome_from_email(email)
    resposta = nil

    if (!email.nil?)
      index = email.index("@")
      # encontrar o simbolo @ dentro da string
      resposta = email.slice(0..(index - 1))
      log("resposta: #{resposta}")
    end
    return resposta
  end
end
