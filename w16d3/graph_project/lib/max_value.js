function maxValue(node, visited=new Set()) {
    let queue = [node];
    let max = 0
    // let visited = new Set();

    while (queue.length) {
        let node = queue.shift();
        if (visited.has(node)) continue;
        visited.add(node);
        if (node.val > max) max = node.val;

        queue.push(...node.neighbors);
    }

    return max;
}

module.exports = {
    maxValue
};