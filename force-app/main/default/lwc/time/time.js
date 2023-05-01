import { LightningElement,track } from 'lwc';

export default class Firstlwc extends LightningElement {
    @track time="3:40 PM";
    name ="First LWC Program";
    connectedCallback(){
        this.gettime();
        setInterval(()=>{
            this.gettime();
        },1000);
    }
    gettime(){
        const date = new Date();
        const hour = date.getHours();
        const min = date.getMinutes();
        const sec = date.getSeconds();
        this.time = this.updatehour(hour)+' : '+this.updatemin(min)+' : '+this.getsecond(sec)+' '+this.updateampm(hour);

    }
    updatemin(min){
        if(min<10){
            return '0'+min;
        }
        else{
            return min;
        }
    }
    getsecond(sec){
        if(sec<10){
            return '0'+sec;
        }
        else{
            return sec;
        }
    }
    updatehour(hours){
        if(hours>12){
            return '0'+(hours-12);
        }
        else{
            return hours;
        }
    }
    updateampm(hours){
        if(hours>12){
            return 'PM';
        }
        else{
            return 'AM';
        }
    }

}