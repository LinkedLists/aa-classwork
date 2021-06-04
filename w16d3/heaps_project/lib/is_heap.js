// you may assume that the array will always have a null element at the 0-th index
function isMaxHeap(array) {
    let isComplete = array.every(ele => ele !== undefined);
    return isComplete && _isMaxHeap(array);
}

function _isMaxHeap(array, i=1) {
    if (array[i] === undefined) return true;
    let leftIdx = 2 * i;
    let rightIdx = 2 * i + 1;
    let leftVal = array[leftIdx] === undefined ? -Infinity : array[leftIdx];
    let rightVal = array[rightIdx] === undefined ? -Infinity : array[rightIdx];
    return array[i] > leftVal && array[i] > rightVal 
        && _isMaxHeap(array, leftIdx) && _isMaxHeap(array, rightIdx);
}


module.exports = {
    isMaxHeap
};