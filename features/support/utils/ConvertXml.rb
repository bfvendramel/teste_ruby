class ConvertXml
  def convertXmlToHash(bodyXml)
    return Crack::XML.parse(bodyXml)
  end

  def convertHashToXml(bodyJson)
    return bodyJson[bodyJson.keys.first].to_xml(root: bodyJson.keys.first)
  end
end
