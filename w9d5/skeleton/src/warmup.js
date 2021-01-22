
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  const p = document.createElement("p");
  p.textContent = string;

  while (htmlElement.hasChildNodes()) {
    htmlElement.removeChild(htmlElement.firstChild);
  }
  htmlElement.append(p);

};

htmlGenerator('Party Time. lol', partyHeader);