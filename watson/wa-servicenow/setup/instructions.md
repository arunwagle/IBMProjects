# Setup

1. [Clone the repository](#clone-repo)
2. [Create a free IBM Cloud Account](#create-free-ibm-account)
3. [Setup IBM Services](#setup-ibm-services)
4. [Deploy Web Application](#deploy-web-application)
5. [Deploy Voice + SMS Virtual Assistant](#deploy-voice-sms-va)
6. [Deploy SMS Virtual Assistant](#deploy-sms-va)
7. [Deploy Slack Virtual Assistant](#deploy-slack-va)

## Clone repository
```
   git clone https://github.com/arunwagle/Covid-19-Crisis-Communication-Finance.git   
```

## Create a free IBM Cloud Account

[Create New IBM Cloud Account](https://cloud.ibm.com/registration)

## Setup IBM Services

### Watson Assistant

1. [Create and Launch Watson Asssitant Service](https://cloud.ibm.com/docs/assistant?topic=assistant-getting-started#getting-started-prerequisites)

2. Create Web+Slack dialog skill by importing the [skill-Covid-19-Financial-Virtual-Assistant---Web%2BSlack.json](/watson-assets/WatsonAssistant/skill-Covid-19-Financial-Virtual-Assistant---Web%2BSlack.json)
Note: Refer to [How to import dialog skill](https://cloud.ibm.com/docs/assistant?topic=assistant-skill-dialog-add)

3. Create Voice+SMS dialog skill by importing the [skill-Covid-19-Financial-Virtual-Assistant---Voice-%2B-SMS.json](/watson-assets/WatsonAssistant/skill-Covid-19-Financial-Virtual-Assistant---Voice-%2B-SMS.json)

4. Create SMS dialog skill by importing the [skill-Covid-19-Financial-Virtual-Assistant---SMS.json](/watson-assets/WatsonAssistant/skill-Covid-19-Financial-Virtual-Assistant---SMS.json)

5. Create Search Skill "Covid-19 FAQ Search Skill" in Watson Assistant. Select Title = "extracted_metadata.title", Body = "text" and URL = "metadata.source.url" 
Note: [Refer to](https://cloud.ibm.com/docs/assistant?topic=assistant-skill-search-add)
**This step has to be completed after the Watson Discovery setup is completed **

6. Once all the skills are created, you can use "Try it Out" pane to test your skill.
Note: Refer to [Try it out](https://cloud.ibm.com/docs/assistant?topic=assistant-tutorial#tutorial-test-menu-options-intent)

### Watson Discovery

1. [Create and Launch Watson Discovery Service](https://cloud.ibm.com/docs/discovery?topic=discovery-getting-started)

2. Create COVID-19 Kit
   1. Watson Discovery released **COVID-19 Kit** which has an FAQ extractor that is pre configured to extract data from the following sources. This can be extended to add more sources later.
   
   https://faq.coronavirus.gov/
   https://www.who.int/news-room/q-a-detail/q-a-coronaviruses
   https://www.health.harvard.edu/diseases-and-conditions/treatments-for-covid-19
   https://www.health.harvard.edu/diseases-and-conditions/if-you-are-at-higher-risk
   https://www.health.harvard.edu/diseases-and-conditions/if-youve-been-exposed-to-the-coronavirus
   https://www.health.harvard.edu/diseases-and-conditions/coronavirus-outbreak-and-kids
   https://www.health.harvard.edu/diseases-and-conditions/coronavirus-resource-center
   https://www.dol.gov/agencies/whd/flsa/pandemic
   https://www.dol.gov/agencies/whd/fmla/pandemic
   https://www.dol.gov/coronavirus/unemployment-insurance
    
   
   2. Create a collection by selecting COVID-19 Kit. 
   3. Customize to add the IRS source. This has information on the relief act passed by the goverment
   https://www.irs.gov/newsroom/economic-impact-payments-what-you-need-to-know
   
3. Choose a **Sync frequency** to "once a day"

   
### Speech to Text
[Create Speech To Text Service](https://cloud.ibm.com/docs/services/speech-to-text?topic=speech-to-text-gettingStarted#getting-started-tutorial)

### Text to Speech
[Create Text To Speech Service](https://cloud.ibm.com/docs/services/text-to-speech?topic=text-to-speech-gettingStarted#getting-started-tutorial)

### Voice Agent with Watson
1. [Create a Voice Agent Service](https://cloud.ibm.com/docs/services/voice-agent?topic=voice-agent-getting-started#step1)
2. [Create a Twilio SIP Trunk](https://cloud.ibm.com/docs/services/voice-agent?topic=voice-agent-connect#twilio-setup)
3. Set up an SMS Provider for SMS capabilities
   1. Generate API Key from the **Service credentials** tab on the left.
   2. [Setup SMS Agent](https://cloud.ibm.com/docs/services/voice-agent?topic=voice-agent-sms_config_instance)
   3. [Setup SMS enabled Voice Agent](https://cloud.ibm.com/docs/services/voice-agent?topic=voice-agent-sms_voice_config_instance)
   4. Connect to your agents created in step 2 and 3 above (you have to create 2 agents, one for ems enabled voice and the other for only SMS)
      
   5. Test your agent
      1. Call the phone number that you configured to speak to your voice agent. If you hear a response, your voice agent is active. OR
      2. Text the phone number that you configured to initiate an SMS session. If you receive an SMS back, your SMS agent is active.


## Deploy Web Application

### Create Assistant 

Create Assistant [Link](https://cloud.ibm.com/docs/assistant?topic=assistant-assistant-add)
1. Select the Covid-19 Financial Virtual Assistant - Web+Slack created in the above step
2. Select the Covid-19 FAQ Search Skill created in the above step
3. Add Integrations
   1. Add Web Chat integration [Link](https://cloud.ibm.com/docs/assistant?topic=assistant-deploy-web-chat)   
   2. Copy the script that is generated as a part of the creation step. This needs to be copied to the index.html file located under [index.html](/generic-covid19-assistant/public/index.html)
   3. Go to the location of the clone directory on your machine and open "/generic-covid19-assistant/public/index.html". 
   
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
4. Deploy a Cloud Foundary App
   1. [Create a cloud foundary app](https://cloud.ibm.com/docs/apps?topic=creating-apps-tutorial-byoc#create-byoc)
   2. [Edit github repo to point to this repo](https://cloud.ibm.com/docs/apps?topic=creating-apps-tutorial-byoc#repo-byoc-edit)
   3. [Enabling you app for IBM Cloud](https://cloud.ibm.com/docs/apps?topic=creating-apps-tutorial-byoc#enable-byoc-cli)
   4. [Deploying your app](https://cloud.ibm.com/docs/apps?topic=creating-apps-tutorial-byoc#toolchain-byoc)


## Deploy Voice + SMS Virtual Assistant

When configuring "Voice Agent with Watson" for voice and sms, you have to select the **skill-Covid-19-Financial-Virtual-Assistant---Voice-%2B-SMS.json**


## Deploy SMS Virtual Assistant
When configuring "Voice Agent with Watson" for sms, you have to select the **skill-Covid-19-Financial-Virtual-Assistant---SMS.json**


## Deploy Slack Virtual Assistant
1. [Integrating with Slack](https://cloud.ibm.com/docs/assistant?topic=assistant-deploy-slack)
2. Select **skill-Covid-19-Financial-Virtual-Assistant---Web%2BSlack.json** for slack.



