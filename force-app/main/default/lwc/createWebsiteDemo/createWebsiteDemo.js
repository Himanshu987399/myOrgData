import { LightningElement } from 'lwc';
export default class CreateWebsiteDemo extends LightningElement {
    shownav=false;
    showNavigation(){
        if(this.shownav){
            this.shownav=false;
        }
        else{
            this.shownav=true;
        }
    }
}