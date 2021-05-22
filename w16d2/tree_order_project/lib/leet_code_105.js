// View the full problem and run the test cases at:
//  https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/

const { TreeNode } = require('./tree_node.js');


function buildTree(preorder, inorder) {
  if (!preorder.length && !inorder.length) return null;

  let root = new TreeNode(preorder[0])
  let i = inorder.indexOf(root.val)

  let inorderL = inorder.slice(0, i)
  let inorderR = inorder.slice(i + 1)

  
  let preorderL = preorder.filter(val => inorderL.includes(val));
  let preorderR = preorder.filter(val => inorderR.includes(val));

  root.left = buildTree(preorderL, inorderL)
  root.right = buildTree(preorderR, inorderR)

  return root

}
