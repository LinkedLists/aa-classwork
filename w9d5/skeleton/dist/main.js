/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "./src/clock.js":
/*!**********************!*\
  !*** ./src/clock.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup.js */ \"./src/warmup.js\");\n\r\n\r\nclass Clock {\r\n  constructor() {\r\n    // 1. Create a Date object.\r\n    const currentTime = new Date();\r\n\r\n    // 2. Store the hour, minute, and second.\r\n    this.hours = currentTime.getHours();\r\n    this.minutes = currentTime.getMinutes();\r\n    this.seconds = currentTime.getSeconds();\r\n\r\n    // 3. Call printTime.\r\n\r\n    // 4. Schedule the tick at 1 second intervals.\r\n    (0,_warmup_js__WEBPACK_IMPORTED_MODULE_0__.htmlGenerator)(this.printTime(), clockElement);\r\n    setInterval(this._tick.bind(this), 1000);\r\n  }\r\n\r\n  printTime() {\r\n    // Format the time in HH:MM:SS\r\n    const timeString = [this.hours, this.minutes, this.seconds].join(\":\");\r\n\r\n    // Use console.log to print it.\r\n    // console.log(timeString);\r\n\r\n    return timeString;\r\n  }\r\n\r\n  _tick() {\r\n    // 1. Increment the time by one second.\r\n    this._incrementSeconds();\r\n\r\n    (0,_warmup_js__WEBPACK_IMPORTED_MODULE_0__.htmlGenerator)(this.printTime(), clockElement);\r\n    // 2. Call printTime.\r\n    // this.printTime();\r\n  }\r\n\r\n  _incrementSeconds() {\r\n    // 1. Increment the time by one second.\r\n    this.seconds += 1;\r\n    if (this.seconds === 60) {\r\n      this.seconds = 0;\r\n      this._incrementMinutes();\r\n    }\r\n  }\r\n\r\n  _incrementMinutes() {\r\n    this.minutes += 1;\r\n    if (this.minutes === 60) {\r\n      this.minutes = 0;\r\n      this._incrementHours();\r\n    }\r\n  }\r\n\r\n  _incrementHours() {\r\n    this.hours = (this.hours + 1) % 24;\r\n  }\r\n}\r\n\r\n// let time = clock.printTime();\r\n\r\nconst clockElement = document.getElementById(\"clock\");\r\nconst clock = new Clock;\r\n// htmlGenerator(time, clockElement);\n\n//# sourceURL=webpack:///./src/clock.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n/* harmony import */ var _clock__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./clock */ \"./src/clock.js\");\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/warmup.js":
/*!***********************!*\
  !*** ./src/warmup.js ***!
  \***********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"htmlGenerator\": () => /* binding */ htmlGenerator\n/* harmony export */ });\n\nconst partyHeader = document.getElementById('party');\n\nconst htmlGenerator = (string, htmlElement) => {\n  const p = document.createElement(\"p\");\n  p.textContent = string;\n\n  while (htmlElement.hasChildNodes()) {\n    htmlElement.removeChild(htmlElement.firstChild);\n  }\n  htmlElement.append(p);\n\n};\n\nhtmlGenerator('Party Time. lol', partyHeader);\n\n//# sourceURL=webpack:///./src/warmup.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		if(__webpack_module_cache__[moduleId]) {
/******/ 			return __webpack_module_cache__[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => Object.prototype.hasOwnProperty.call(obj, prop)
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	// startup
/******/ 	// Load entry module
/******/ 	__webpack_require__("./src/index.js");
/******/ 	// This entry module used 'exports' so it can't be inlined
/******/ })()
;