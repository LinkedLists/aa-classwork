function breadthFirstSearch(startingNode, targetVal) {
    let queue = [startingNode]
    let currentNode
    let visited = new Set()

    while (queue.length) {
        currentNode = queue.shift()
        if (visited.has(currentNode)) continue
        visited.add(currentNode)
        if (currentNode.val === targetVal) return currentNode
        // queue.concat(currentNode.neighbors)
        queue.push(...currentNode.neighbors)
    }

    return null
}

module.exports = {
    breadthFirstSearch
};