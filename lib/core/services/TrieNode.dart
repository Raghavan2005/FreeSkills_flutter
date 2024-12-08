class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

class Trie {
  final TrieNode root = TrieNode();

  // Insert a word into the Trie
  void insert(String word) {
    TrieNode current = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!current.children.containsKey(char)) {
        current.children[char] = TrieNode();
      }
      current = current.children[char]!;
    }
    current.isEndOfWord = true;
  }

  // Search for words that start with a given prefix
  List<String> search(String prefix) {
    TrieNode? current = root;
    for (int i = 0; i < prefix.length; i++) {
      String char = prefix[i];
      if (!current!.children.containsKey(char)) {
        return []; // Prefix not found
      }
      current = current.children[char];
    }
    // Collect all words starting from the current node
    return _collectWords(prefix, current);
  }

  // Helper function to collect words from a given TrieNode
  List<String> _collectWords(String prefix, TrieNode? node) {
    List<String> words = [];
    if (node == null) return words;

    if (node.isEndOfWord) {
      words.add(prefix);
    }

    for (String char in node.children.keys) {
      words.addAll(_collectWords(prefix + char, node.children[char]));
    }

    return words;
  }
}
