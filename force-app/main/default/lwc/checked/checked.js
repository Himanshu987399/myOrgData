import { LightningElement } from 'lwc';

export default class FirstLWCquestion extends LightningElement {
    nameVal;
    ratingVal;
    industryVal;
    accountId;
    hideBtn= false;
    handleSuccess(event) {
        this.accountId = event.detail.id;
    }
    handleChange(event){
      var fieldname = event.target.name;
     if(fieldname == 'Acname'){
       this.nameVal= event.target.value;
     }
    else if(fieldname == 'rate'){
      this.ratingVal = event.target.value;
    }else if (fieldname == 'industry'){
      this.industryVal = event.target.value;
    }
  
  
    if(this.nameVal== 'test' && this.ratingVal == 'Hot' && this.industryVal =='Agriculture'){
      this.hideBtn = true;
    }else{
      this.hideBtn = false;
    }
}
}