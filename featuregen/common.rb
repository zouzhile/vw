require "stemmer"

class String
    include Stemmable
end

$stopwords = "a,able,about,across,after,all,almost,also,am,among,an,and,any,are,as,at,be,because,been,but,by,can,cannot,could,dear,did,do,does,either,else,ever,every,for,from,get,got,had,has,have,he,her,hers,him,his,how,however,i,if,in,into,is,it,its,just,least,let,like,likely,may,me,might,most,must,my,neither,no,nor,not,of,off,often,on,only,or,other,our,own,rather,said,say,says,she,should,since,so,some,than,that,the,their,them,then,there,these,they,this,tis,to,too,twas,us,wants,was,we,were,what,when,where,which,while,who,whom,why,will,with,would,yet,you,your".split(",")

def is_stopword(word)
    $stopwords.include?(word.downcase.strip) or word.length < 3
end

def clean_text(text)
  text.gsub(/[\.|,|>|<|~|=|\-|_|+|\||\\|\/|{|}|(|)|'|"|:|;|\?|\[|\]|!|@|#|\$|\%|\^|&|\*]/, " ").strip
end

def stem(text)
  text.strip.downcase.stem
end

def load_map(filepath) 
  data = {}
  open(filepath).each do |line|
    parts = line.strip.split("\t")
    data[parts[0]] = parts[1]
  end
  return data
end

def dump_map(map, filepath)
    abs_path = File.absolute_path(filepath) 
    `mkdir -p #{File.dirname(abs_path)}`
    out = open("#{abs_path}", "w")
    map.each_pair do |key, value|
      out.puts "#{key}\t#{value}"
    end
    out.close
end
