console.log("in index")


window.$l = function $l(arg) {
  const nodeList = document.querySelectorAll(arg);
  const nodeArray = Array.from(nodeList);
  return nodeArray
}