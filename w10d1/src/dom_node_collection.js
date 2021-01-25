class DOMNodeCollection{
    constructor(nodesArray){
        this.nodesArray = nodesArray;
    }

    html(string){
        if(typeof string === 'undefined'){
            this.nodesArray[0].innerHTML;
        }else{
            this.nodesArray.forEach((node)=>{
                node.innerHTML = string;
            });
        }
    }

    empty(){
        this.html('');
    }

    append(child){
        this.nodesArray.forEach( (node) => {
            if(typeof node === 'string'){
                node.innerHTML += child;
            } else if (node instanceof HTMLElement){
                node.appendChild(child);
            }else ()
            
        
            node.innerHTML += child;
        });
    }

    attr() {}

    addClass(newClass) {
        this.forEach( (node) => {
            node.classList.add(newClass);
        });
    }

    removeClass(oldClass) {
        this.forEach( (node) => {
            node.classList.remove(oldClass);
        });
    }

}

module.exports = DOMNodeCollection;