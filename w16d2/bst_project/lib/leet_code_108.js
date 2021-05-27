// View the full problem and run the test cases at:
//  https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/


function sortedArrayToBST(nums) {
  if (!nums.length) return null;
    
  let i = Math.floor(nums.length / 2);

  let root = new TreeNode(nums[i]);

  let left = sortedArrayToBST(nums.slice(0, i))
  let right = sortedArrayToBST(nums.slice(i + 1))

  root.left = left
  root.right = right

  return root
}