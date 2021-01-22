
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator(dogs) {

  const dogArr = [];

  for (const name in dogs) {
    const a = document.createElement("a");
    a.innerHTML = name;
    a.href = dogs[name];
    const li = document.createElement("li");
    li.classList = "dog-link";
    li.append(a);
    dogArr.push(li)
  }
}

function attachDogLinks(){
  dogLinkCreator(dogs);
}

