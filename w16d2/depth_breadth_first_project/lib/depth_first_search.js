function depthFirstSearch(root, targetVal) {
    // if (root) {

    //     if (root.val === targetVal) return root

    //     if (root.left) depthFirstSearch(root.left, targetVal)
    //     if (root.right) depthFirstSearch(root.right, targetVal)
    // }
    // return null


    let stack = [root];

    while (stack.length) {
        let node = stack.pop();

        if (node.val === targetVal) return node;

        if (node.right) stack.push(node.right);
        if (node.left) stack.push(node.left);
    }

    return null;
}


module.exports = {
    depthFirstSearch
};