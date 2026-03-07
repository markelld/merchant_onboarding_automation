class GoogleDocIdExtractor
  def self.call(url)
    cleaned = url.to_s.strip.delete('"')
    parts = cleaned.split("/document/d/")
    raise "Invalid Google Doc URL" if parts.length < 2

    doc_id = parts[1].split("/").first
    raise "Invalid Google Doc URL" if doc_id.blank?

    doc_id
  end
end