class ArquivoUtils
  require "fileutils"

  def escrevendoArquivo(directory, nomeArqExtra, dadosASalvar)
    if !File.directory?(directory)
      # Criando diretório se não existe
      FileUtils.mkdir_p directory.to_s
    end

    nomeArquivo = directory + nomeArqExtra + ".txt"

    log("Arquivo será salvo em: #{nomeArquivo}")

    begin
      arq = File.new(nomeArquivo, "w") # abri o arquivo em modo de escrita

      # Incluir dados no arquivo
      arq.log("#{dadosASalvar}")
    ensure
      if !arq.nil?
        arq.close unless arq.closed?
      end
    end
    # Fim do método
  end

  # Fim da classe
end
