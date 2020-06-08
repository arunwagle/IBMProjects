# ServiceNow Design

1. [Virtual Agent Designer Flow Design](#virtual-agent-designer-flow-design)
2. [Node Design](#node-design)
3. [Runtime Screenshot](#runtime-screenshot)


## Virtual Agent Designer Flow Design

### Overall Dialog Flow

<img src="wa-service-now-flow.png"/>

## Node Design

### Node - Initialize Assistant (Type: Script Action Basic Info)
Action Expression
````
(function execute() {
    vaVars.assistant_id = gs.getProperty('watson_assistant.v2.assistantID');
    var assistant = new global.IBMWatsonAssistantV2(vaVars.assistant_id);
    vaVars.session_id = assistant.createSession();
})()
```` 

### Node - Send Message to Watson (Type: Script Action Basic Info)
Action Expression
````
(function execute() {
    vaVars.assistant_id = gs.getProperty('watson_assistant.v2.assistantID');
    var assistant = new global.IBMWatsonAssistantV2(vaVars.assistant_id);
    vaVars.session_id = assistant.createSession();
})()
```` 
Condition (Script)
````
(function execute() {    
    return true;
})()
```` 

### Node - Load Conversations (Type: Script Action Basic Info)
Action Expression
````
(function execute() {
    gs.info("START:: Load Conversations"); 
    var watsonResponseObj = JSON.parse(vaVars.watsonResponse)
    vaVars.endFlow = true;
    if (watsonResponseObj.output.generic.length > 0){
        vaVars.endFlow = false;
        recordCount = watsonResponseObj.output.generic.length;
        
        var textUserInputResponse ;
        var choiceUserInputResponse;
        var multiFlowResponse = [];
        var searchFlowResponse;
        var connectToAgentInputResponse = false;

        var finalResponse = [];

        var textRecords =  watsonResponseObj.output.generic.filter(function(record) {            
	        return record.response_type === 'text';
        });
        var choiceRecords =  watsonResponseObj.output.generic.filter(function(record) {
	        return record.response_type === 'option';
        });

        gs.info("Load Conversations::textRecords::" + JSON.stringify(textRecords));
        gs.info("Load Conversations::watsonResponseObj::length::" + watsonResponseObj.output.generic.length);

        for (i = 0; i < watsonResponseObj.output.generic.length; i++) {
           var response_type = watsonResponseObj.output.generic[i].response_type;
           gs.info("Load Conversations::response_type::" + response_type);
           
           if (response_type === 'option'){                         
              choiceUserInputResponse = watsonResponseObj.output.generic[i];            
           }                  
           else if (response_type === 'text'){
               textVal = watsonResponseObj.output.generic[i].text;
               gs.info("+++++++Load Conversations::index::" + textVal.indexOf("search")); 
               if(textVal.indexOf("search") !== -1){
                   searchFlowResponse = watsonResponseObj.output.generic[i];
               }
               else if(recordCount == 1){ 
                  var textVal = watsonResponseObj.output.generic[i].text;                     
                  textUserInputResponse = watsonResponseObj.output.generic[i];                  
               }
               else{
                   currentText = watsonResponseObj.output.generic[i];
                   lastText = textRecords[textRecords.length -1];
                   if(choiceRecords.length == 0 && currentText === lastText){
                       textUserInputResponse = watsonResponseObj.output.generic[i];
                   }
                   else{
                       multiFlowResponse.push(watsonResponseObj.output.generic[i]);
                   }   
               }
           }
           else if (recordCount == 1 && response_type === 'connect_to_agent'){               
              connectToAgentInputResponse = true;
           }        
        }
        
        vaVars.multiFlowResponseJSON = JSON.stringify(multiFlowResponse); 
        vaVars.searchFlowResponseJSON = JSON.stringify(searchFlowResponse); 
        vaVars.choiceUserInputResponse = JSON.stringify(choiceUserInputResponse); 
        vaVars.textUserInputResponse = JSON.stringify(textUserInputResponse); 
        vaVars.connectToAgentInputResponse = connectToAgentInputResponse;
        gs.info("END::Load Conversations: multiFlowResponse :: " + vaVars.multiFlowResponseJSON
               + " choiceUserInputResponse:: " + vaVars.choiceUserInputResponse
               + " textUserInputResponse:: " + vaVars.textUserInputResponse
               + " searchFlowResponse::" + vaVars.searchFlowResponseJSON
               + " connectToAgentInputResponse:: " + vaVars.connectToAgentInputResponse); 

        return true;
    }
    return false;
})()

```` 

### Node Edge - Continue Flow
Condition (Script)
````
(function execute() {
    return vaVars.connectToAgentInputResponse === true ? false : true;      
})()

```` 
### Node Edge - End Flow
Condition (Script)
````
(function execute() {
    return (vaVars.endFlow === true || 
            vaVars.connectToAgentInputResponse === true) ? true : false;      
})()

```` 

### Node - Initialize Multi Flow Index (Type: Script Action Basic Info)
Action Expression
````
(function execute() {
    vaVars.currentIndex = 0;     
})()

````
### Node - Step Multi Flow Response (Type: Script Action Basic Info)
Action Expression
````
(function execute() {
    var i = vaVars.currentIndex; 
    gs.info("START :: Step Multi Flow Response: response ::currentIndex ::" + i ); 
    var multiFlowResponseArr = JSON.parse(vaVars.multiFlowResponseJSON); 
    var multiFlowResponseObj = multiFlowResponseArr[i];
      
    if (multiFlowResponseObj.response_type === 'text'){
        vaVars.multiFlowTextResponse = true;        
    } 
    else if (multiFlowResponseObj.response_type === 'image'){
        vaVars.multiFlowImageResponse = true;            
    }    
           
    vaVars.currentMultiFlowResponseJSON = JSON.stringify(multiFlowResponseObj);
    gs.info("END :: Step  Multi Flow Response:: currentMultiFlowResponseJSON::" +  vaVars.currentMultiFlowResponseJSON);
})()

```` 
Condition (Script)
````
(function execute() {
    var multiFlowResponse = JSON.parse(vaVars.multiFlowResponseJSON);     
    var runMultiFlow = multiFlowResponse.length > 0 ? true : false;
    gs.info("CONDITION::Step Multi Flow Response:: runMultiFlow:: " + runMultiFlow);
    return runMultiFlow;
})()

```` 
### Node - Render Text (Type: Text Output Basic Info)
Action Expression
````
(function execute() {
   var currentMultiFlowResponse = JSON.parse(vaVars.currentMultiFlowResponseJSON)
   vaVars.multiFlowTextResponse = false;      
   return currentMultiFlowResponse.text;  
    
})()


```` 
Condition (Script)
````
(function execute() {

    var isMultiFlowTextResponse = vaVars.multiFlowTextResponse == true ? true : false;
    gs.info("CONDITION::Render Text:: isMultiFlowTextResponse:: " + isMultiFlowTextResponse);
    return isMultiFlowTextResponse;
})()
```` 

### Node - Render Image (Type: Image Basic Info)
Action Expression
````
(function execute() {
   var currentMultiFlowResponse = JSON.parse(vaVars.currentMultiFlowResponseJSON)
   gs.info("Render Image ::currentMultiFlowResponse:: " + currentMultiFlowResponse ); 
   vaVars.multiFlowImageResponse = false;    
   return currentMultiFlowResponse.source;  
    
})()

```` 
Condition (Script)
````
(function execute() { 
    var isMultiFlowImageResponse = vaVars.multiFlowImageResponse == true ? true : false;
    gs.info("CONDITION:: Render Image :: isMultiFlowImageResponse:: " + isMultiFlowImageResponse);
    return isMultiFlowImageResponse;
})()
```` 

## Runtime Screenshot



