
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

// export const dogLinkCreator = (dogs) => {
function dogLinkCreator(dogs) {
  // debugger
  const dogArr = [];
  
  for (const name in dogs) {
    const a = document.createElement("a");
    a.innerHTML = name;
    a.href = dogs[name];
    const li = document.createElement("li");
    li.classList = "dog-link";
    li.append(a);
    dogArr.push(li);
  }

  return dogArr;
}

function attachDogLinks(dogs){
  const ul = document.querySelector(".drop-down-dog-list");
  const dogLinks = dogLinkCreator(dogs);
  dogArr.forEach( (li) => {
    ul.append(li);
  });
}
// debugger
attachDogLinks(dogs); //where are the dogs???

function handleEnter() {
  const dogLink = document.querySelector(".dog-link");
  dogLink.addEventListener("mouseenter", (ele) => {
    ele.classList.remove("hidden");
  })
}

function handleLeave() {
  const dogLink = document.querySelector(".dog-link");
  dogLink.addEventListener("mouseleave", (ele) => {
    ele.classList.add("hidden");
  })
}


const nav = document.querySelector(".drop-down-dog-nav");

nav.addEventListener('mouseenter', handleEnter);
nav.addEventListener('mouseleave', handleLeave);