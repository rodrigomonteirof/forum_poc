module Blacklist
 extend self

  def blacklisted?(text)
    blacklisted_words.each do |word|
      if text.match(word)
        return true
      end
    end

    false
  end

  def replace_words(text)
    blacklisted_words.each do |word|
      if text.match(word)
        text = text.gsub(word, BLACKLIST['replacement'])
      end
    end

    text
  end

  def blacklisted_words
    blacklist = []

    BLACKLIST['words'].split.each do |word|
      blacklist << word
      blacklist.concat(variations_for(word))
    end

    blacklist
  end

  def variations_for(word)
    variations=[]

    character_variations.each do |k,v|
      v.split.each do |variation|
        if word.match(k)
          variations << word.gsub(k,variation)
        end
      end
    end

    variations
  end

  def character_variations
    BLACKLIST['variations']
  end
end
