class ArquivoEvidencia
  def gerar_evidencias(page)
    if $screenshot
      # puts "\n============================\n"
      # puts "file_evidencia_base: #{$file_evidencia_base}"
      # puts "\n============================\n"
      page.save_screenshot("#{$file_evidencia_base}/#{$count}.png")
      $count = $count + 1
    end
  end

  def criarEvidenciaArquivo
    if $screenshot
      date = Time.now.strftime("%d%m%Y_%H")
      diretorio = "results/evidencias/#{date}/"
      if (!$file_evidencia_base.nil?)
        diretorio = $file_evidencia_base
      end

      if ($nomeFinDocType.nil?)
        nomeArquivo = $nomeBanco + "_sem_tag"
        $count = $count + 1
      else
        nomeArquivo = $nomeBanco + "_com_tag_" + $nomeFinDocType
      end

      # puts "\n nomeArquivo: #{nomeArquivo}"

      if !nomeArquivo.nil?
        ArquivoUtils.new.escrevendoArquivo(diretorio, nomeArquivo, $dadoEvidencia)
      else
        puts "Problemas para cria o arquivo de evidencias!"
      end
    end
    $nomeFinDocType = nil #limpa valor da variavel
  end

  # Fim da classe
end
