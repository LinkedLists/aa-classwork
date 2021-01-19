function bubbleSort(arr) {
  let solved = false;

  while (!solved) {
    solved = true;
    for (i = 0; i < arr.length - 1; i++){
      if (arr[i] > arr[i + 1]) {
        let temp = arr[i + 1];
        arr[i + 1] = arr[i];
        arr[i] = temp;
        solved = false;
      }
    }
  }
  return arr
}

// console.log(bubbleSort([1,2,6,8,3,0,9,8,6]));

function subStrings(str) {
  sub_str = [];
  for (i = 1; i < str.length; i++) {
    for (j = 0; j < str.length - i + 1; j++) {
      sub_str.push(str.slice(j, j + i));
    }
  }
  return sub_str
}

let words = "012345";
console.log(subStrings(words));