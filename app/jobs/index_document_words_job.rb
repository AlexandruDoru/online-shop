class IndexDocumentWordsJob < Struct.new(:document_id)
  
  def perform
    document = Document.find(document_id)
    striped_content = ActionView::Base.full_sanitizer.sanitize(document.content)
    ActiveRecord::Base.transaction do
      striped_content.scan(/\w+/).each_with_index do |word, index|
        WordIndex.create(word: word, document_id: document_id, pos: index)
      end
    end
  end

end
