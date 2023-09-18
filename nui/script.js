let elements = [];
let escape_keys = [];

$(function(){
    window.onload = (e) => {
        window.addEventListener('message', (event) => {
            var item = event.data;
            if (item.type === "setup") {
                elements.push({
                    id: item.data.id,
                    name: item.data.name,
                    image_label: item.data.image_label,
                    description: item.data.description,
                    color: item.data.color
                });
                if (item.data.id === item.callback) {
                    function generateHTMLAndCSS() {
                        let htmlCode = "";
                        elements.forEach(element => {
                    
                            htmlCode += `
                                <div class="element ${element.id}" 
                                     style="background-color: ${element.color}; box-shadow: 0px 0px 20px ${element.color};">
                                    <img src="./images/${element.image_label}">
                                </div>
                            `;
                        });
                    
                        const boxElement = document.querySelector('.box');
                        if (boxElement) {
                            boxElement.innerHTML = boxElement.innerHTML + htmlCode;
                        }
                    
                        var clip_correction = ((1-(boxElement.offsetWidth/(boxElement.offsetWidth+ 2*75)))/2)*100 - 0.5;
                    
                        const hoverBoxElement = document.querySelector(".hover_box");
                        hoverBoxElement.style.clipPath = `polygon(0 0%, 100% 0%, ${100 - clip_correction}% 100%, ${clip_correction}% 100%)`;
                    
                    }
                    
                    function hexToRgb(hex) {
                        let bigint = parseInt(hex.slice(1), 16);
                        let r = (bigint >> 16) & 255;
                        let g = (bigint >> 8) & 255;
                        let b = bigint & 255;
                    
                        return [r, g, b];
                    }
                    
                    generateHTMLAndCSS();
                    
                    const domElements = document.querySelectorAll('.box .element');
                    const hoverBox = document.querySelector('.box .hover_box');
                    
                    domElements.forEach(domElement => {
                        domElement.addEventListener('mouseenter', function() {
                            let id = parseInt(domElement.classList[1], 10);
                            let matchingElement = elements.find(element => element.id === id);
                            
                            if (matchingElement) {
                                let rgb = hexToRgb(matchingElement.color);
                                hoverBox.querySelector('img').src = `./images/${matchingElement.image_label}`;
                                hoverBox.querySelector('.title').textContent = matchingElement.name + " : ";
                                hoverBox.querySelector('.description').textContent = matchingElement.description;
                    
                                hoverBox.style.backgroundImage = `linear-gradient(rgba(0,0,0,0), rgba(${rgb[0]}, ${rgb[1]}, ${rgb[2]}, 0.50))`;
                                hoverBox.style.opacity = "1";
                            }
                        });
                    
                        domElement.addEventListener('mouseleave', function() {
                            hoverBox.style.opacity = "0";
                        });

                        domElement.addEventListener('click', function() {
                            hoverBox.style.opacity = "0";
                            id = parseInt(domElement.classList[1], 10);

                            fetch(`https://${GetParentResourceName()}/elementSelected`, {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/json; charset=UTF-8',
                                },
                                body: JSON.stringify({
                                    id: id
                                })
                            }).then(resp => resp.json()).then(resp => console.log(resp));

                        });
                    });
                }
            }
            else if (item.type === "triggerui") {
                const container = document.querySelector('.container');
                if (item.display) {
                    container.classList.add('active');
                    window.addEventListener('keydown', function(event) {
                        if(escape_keys.includes(event.key)) {

                            const hoverBox = document.querySelector('.box .hover_box');
                            hoverBox.style.opacity = "0";
                            fetch(`https://${GetParentResourceName()}/escapeui`, {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/json; charset=UTF-8',
                                },
                                body: JSON.stringify({})}).then(resp => resp.json()).then(resp => console.log(resp));
                        }
                    })
                }
                else {
                    container.classList.remove('active');
                }
            }
            else if (item.type === "setupclosekey") {
                escape_keys.push(item.data);
            }
        });
    };
});