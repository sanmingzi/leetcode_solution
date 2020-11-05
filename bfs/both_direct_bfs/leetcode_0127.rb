# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {Integer}
def ladder_length(begin_word, end_word, word_list)
  return 0 if(!word_list.include?(end_word))
  word_list << begin_word if(!word_list.include?(begin_word))

  edges, word_ids = [], {}
  @node_num = 0
  word_list.each { |word| add_edge(word, word_ids, edges) }

  step = 0
  begin_node, end_node = word_ids[begin_word], word_ids[end_word]
  queue0, queue1 = [begin_node], [end_node]
  flag0, flag1 = Array.new(@node_num, false), Array.new(@node_num, false)
  flag0[begin_node], flag1[end_node] = true, true
  while !queue0.empty?
    step += 1
    queue0.length.times {
      node = queue0.shift
      edges[node].each do |next_node|
        next if true == flag0[next_node]
        return (step / 2) + 1 if true == flag1[next_node]
        queue0.push(next_node)
        flag0[next_node] = true
      end
    }

    step += 1
    queue1.length.times {
      node = queue1.shift
      edges[node].each do |next_node|
        next if true == flag1[next_node]
        return (step / 2) + 1 if true == flag0[next_node]
        queue1.push(next_node)
        flag1[next_node] = true
      end
    }
  end
  return 0
end

def add_word(word, word_ids, edges)
  if nil == word_ids[word]
    word_ids[word] = @node_num
    edges[@node_num] = []
    @node_num += 1
  end
  return word_ids[word]
end

def add_edge(word, word_ids, edges)
  word_id = add_word(word, word_ids, edges)
  for i in 0...word.length
    next_word = word + ''
    next_word[i] = '*'
    next_word_id = add_word(next_word, word_ids, edges)
    edges[word_id].push(next_word_id)
    edges[next_word_id].push(word_id)
  end
end
