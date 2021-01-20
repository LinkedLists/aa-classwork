function sumArgs() {
    let arr = Array.from(arguments);
    let total = 0; 
    arr.forEach(el => {
        total += el;
    })
    return total; 
}

//console.log(sumArgs(1,2,3));

function sumRest(...arr) {
    let total = 0;
    arr.forEach(el => {
        total += el;
    })
    return total; 
}

//console.log(sumRest(1, 2, 3));
//func.apply(newContext, [args])
//func.bind(newContext)(arguments) or (newContext, arguments) or (newContext, arg1)(arg2)

// Function.prototype.myBind = function () {
//     let bindArgs = Array.from(arguments);
//     let that = this

//     return function () {
//       let callArgs = Array.from(arguments);
//       let arr = bindArgs.concat(callArgs);
//       that.apply(arr.shift(), arr);
//     }
   
// }

Function.prototype.myBind = function (...bArgs) {
    let bindArgs = [...bArgs];

    return (...cArgs) => {
        let callArgs = [...cArgs];
        let arr = bindArgs.concat(callArgs);
        this.apply(arr.shift(), arr);
    }
}

function curriedSum(numArgs) {
    const numbers = [];
    let sum = 0;
    return function _curriedSum(num) {
        numbers.push(num);
        sum += num;
        if (numbers.length === numArgs) {
            return sum;
        } else {
            return _curriedSum;
        }
    }

}

/*const sum = curriedSum(4); //(5);
//console.log(sum);
console.log(sum(5)(30)(20)(1));*/

Function.prototype.curry = function(numArgs) {
    const numbers = [];
    let that = this;
    return function _curryFunction(num) {
        numbers.push(num)
        if (numbers.length === numArgs) {
            // return that(...numbers);
            return that.apply(null, numbers);
        } else {
            console.log(that);
            return _curryFunction;
        }
    }
}

// const sum = function sum(num1, num2) { return num1 + num2 }
