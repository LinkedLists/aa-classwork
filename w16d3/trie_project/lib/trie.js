class Node {
    constructor() {
        this.children = {}
        this.isTerminal = false
    }
}

class Trie {
   constructor() {
       this.root = new Node()
   }

   insertRecur(word, root=this.root) {
       let letter = word[0]

       if (!(letter in root.children)) {
           root.children[letter] = new Node()
       }

       if (word.length === 1) {
            root.children[letter].isTerminal = true
       } else {
            this.insertRecur(word.slice(1), root.children[letter])
       }
   }

   searchRecur(word, root=this.root) {
       let letter = word[0]

       if (word.length === 0) {
           if (root.isTerminal) {
               return true
           } else {
               return false
           }
       }

       if (letter in root.children) {
           return this.searchRecur(word.slice(1), root.children[letter])
       } else {
           return false
       }

   }

   insertIter(word) {
       let root = this.root

       for (let i = 0; i < word.length; i++) {
           let letter = word[i]

           if (!(letter in root.children)) {
               root.children[letter] = new Node()
           }

           root = root.children[letter]
       }

       root.isTerminal = true
   }

   searchIter(word) {
       let root = this.root
       let letter

       for (let i = 0; i < word.length; i++) {
            letter = word[i]
           
            if (!(letter in root.children)) {
               return false
            }
            
            root = root.children[letter]
        }

        if (root.isTerminal) {
            return true
        } else {
            return false
        }
   }

//    print(root=this.root) {
//        for (let letter in root.children) {
//            console.log(letter)
//            this.print(root.children[letter])
//        }
//    }
}

module.exports = {
    Node,
    Trie
};