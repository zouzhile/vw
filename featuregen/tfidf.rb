#!/usr/bin/env ruby
require "#{File.dirname(__FILE__)}/common.rb"

def tfidf(input_paths)
    puts "[tfidf] scanning input data for getting tf and idf"
    total_docs = 0
    term_docs = {} # term -> docs count mapping
    tf = {} # doc -> {term -> tf}
    tfidf = {} # doc -> {term -> tfidf}
    input_paths.each do |input_path|
        total_docs += 1
        term_flag = {} # term -> true, indicating whether the term has been counted for currenct doc
        doc_tf = {}
        doc_max_tf = 0
        open(input_path).each do |line|
            begin
                line = clean_text(line) 
                line.split(/\s+/).each do |term|
                    term = stem(term)
                    next if is_stopword(term)

                    term_docs[term] ||= 0 # for idf
                    if not term_flag[term]  
                        term_flag[term] = true
                        term_docs[term] += 1 
                    end

                    doc_tf[term] ||= 0 # for tf
                    doc_tf[term] += 1
                    doc_max_tf = doc_tf[term] if doc_tf[term] > doc_max_tf
                end
            rescue Exception => e
            end
        end

        doc_tf.each_pair do |term, freq|
            doc_tf[term] = freq * 1.0 / doc_max_tf 
        end
        
        tf[input_path] = doc_tf
    end

    puts "[tfidf] finished scanning, calculating tfidf"
    tf.each_pair do |doc_path, doc_tf|
        doc_tfidf = {}
        doc_tf.each_pair do |term, term_tf|
            next unless term_docs[term] > 0
            term_idf = Math.log(total_docs * 1.0 / term_docs[term]) 
            doc_tfidf[term] = term_tf * term_idf
        end
        tfidf[doc_path] = doc_tfidf
    end

    puts "[tfidf] completed generating tfidf" 
    return tfidf
end

