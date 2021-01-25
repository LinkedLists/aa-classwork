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

}

module.exports = DOMNodeCollection;