({
    doInit:function(component,event,helper){
        component.set("v.one",true);
        component.set("v.two",true);
        component.set("v.three",true);
        component.set("v.one1",true);
        component.set("v.two1",true);
        component.set("v.three1",true);
        component.set("v.one2",true);
        component.set("v.two2",true);
        component.set("v.three2",true);
        
    },
    changeAction : function(component, event, helper) {
        var value = event.getSource().get('v.value');
        component.set('v.Offering1',value);
        console.log(value);
        if(value=='1'){
            component.set('v.one1',false);
                        component.set('v.three1',true);
            component.set('v.two1',true);

        }
        if(value=='2'){
             component.set('v.one1',true);
                        component.set('v.three1',true);
            component.set('v.two1',false);
        }
        if(value=='3'){
             component.set('v.one1',true);
                        component.set('v.two1',true);
            component.set('v.three1',false);
        }
    },
    changeAction1 : function(component, event, helper) {
        
        var conId = event.getSource().get('v.value');
        component.set('v.Offering2',conId);
        var value = component.get('v.Offering1');
        
        console.log(conId);
    },
    changeAction2 : function(component, event, helper) {
        var conId = event.getSource().get('v.value');
        component.set('v.Offering3',conId);
        console.log(conId);
    }
})