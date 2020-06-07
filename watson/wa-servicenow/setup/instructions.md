# Setup

1. [Clone the repository](#clone-repo)
2. [Create a free IBM Cloud Account](#create-free-ibm-account)
3. [Setup IBM Services](#setup-ibm-services)
4. [Setup ServiceNow](#setup-servicenow)
5. [Deploy WA on ServiceNow](#deploy-wa-on-servicenow)


## Clone repository
```
   git clone https://github.com/arunwagle/IBMProjects.git   
```

## Create a free IBM Cloud Account

[Create New IBM Cloud Account](https://cloud.ibm.com/registration)

## Setup IBM Services

### Watson Assistant

1. [Create and Launch Watson Asssitant Service](https://cloud.ibm.com/docs/assistant?topic=assistant-getting-started#getting-started-prerequisites)

2. Create Web+Slack dialog skill by importing the [skill-Covid-19-Financial-Virtual-Assistant---Web%2BSlack.json](/watson-assets/WatsonAssistant/skill-Covid-19-Financial-Virtual-Assistant---Web%2BSlack.json)
Note: Refer to [How to import dialog skill](https://cloud.ibm.com/docs/assistant?topic=assistant-skill-dialog-add)
**Watson Assistant need setting up of Watson Discovery and IBM Cloud Functions **

3. Once all the skills are created, you can use "Try it Out" pane to test your skill.
Note: Refer to [Try it out](https://cloud.ibm.com/docs/assistant?topic=assistant-tutorial#tutorial-test-menu-options-intent)

### Watson Discovery

1. [Create and Launch Watson Discovery Service](https://cloud.ibm.com/docs/discovery?topic=discovery-getting-started)

2. Create COVID-19 Kit
   1. Watson Discovery released **COVID-19 Kit** which has an FAQ extractor that is pre configured to extract data from the following sources. This can be extended to add more sources later.  
   2. Create a collection by selecting COVID-19 Kit. 
   3. Customize to add the IRS source. This has information on the relief act passed by the goverment
   https://www.irs.gov/newsroom/economic-impact-payments-what-you-need-to-know
   
3. Choose a **Sync frequency** to "once a day"

### IBM Cloud Functions
[Create Speech To Text Service](https://cloud.ibm.com/docs/services/speech-to-text?topic=speech-to-text-gettingStarted#getting-started-tutorial)

## Setup ServiceNow
[Create Text To Speech Service](https://cloud.ibm.com/docs/services/text-to-speech?topic=text-to-speech-gettingStarted#getting-started-tutorial)


## Deploy WA on ServiceNow

   ```
   Replace 
   <script src="https://web-chat.global.assistant.watson.appdomain.cloud/loadWatsonAssistantChat.js"></script>
   <script>
     window.loadWatsonAssistantChat({
       integrationID: "441e78a5-7270-4e86-86da-462717ed4133", // The ID of this integration.
       region: "us-south" // The region your integration is hosted in.
     }).then(function(instance){
       instance.render();
     });
   </script>

   with the script that got generated from above.

```



