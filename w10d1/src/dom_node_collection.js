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
        //debugger
        this.nodesArray.forEach( (node) => {
            if(typeof child === 'string'){
                node.innerHTML += child;
            } else if (child instanceof HTMLElement){
                node.appendChild(child.cloneNode());
            }else {
                child.each( (ele) => {
                    node.appendChild(ele.cloneNode());
                });
            }
            
        });
    }

    attr(key, val) {
        if (typeof val === 'string') {
            this.nodesArray.forEach((node) => {
                node.setAttribute(key, val)
            })
        } else {
            return this.nodesArray[0].getAttribute(key)
        }
        
    }

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