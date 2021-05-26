function treeSum(root) {
    // let sum = 0

    // if (!root) return sum

    // sum += treeSum(root.left) + treeSum(root.right)

    // return sum

    if (!root) return 0;

    return treeSum(root.left) + root.val + treeSum(root.right);
}


module.exports = {
    treeSum
};