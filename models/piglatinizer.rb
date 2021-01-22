class PigLatinizer
  VOWELS = %w[a e i o u]

  def split_sentence(sentence)
    sentence.split(' ')
  end

  def piglatinize_word(word)
    if word.length > 1
      word = word.split('')
      word_start = []
      word_end = []
      word.each do |letter|
        next unless VOWELS.include?(letter.downcase)

        word_end = word.slice((word.find_index(letter)..(word.length - 1)))
        if word.find_index(letter) != 0
          word_start = word.slice((0..(word.find_index(letter) - 1)))
          word_start.push('w') if VOWELS.include?(word_start[0].downcase)
          word_start.push('ay')
        else
          word_start = 'way'
        end
        break
      end
      [word_end, word_start].flatten.join
    else
      "#{word}way"
    end
  end

  def piglatinize(phrase)
    if phrase.length > 1
      words = split_sentence(phrase)
      words.collect do |word|
        piglatinize_word(word)
      end.join(' ').to_s
    else
      "#{phrase}way"
    end
  end
end
