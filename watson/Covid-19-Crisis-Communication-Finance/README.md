# Covid-19-Finance-Virtual-Assistant

[![License](https://img.shields.io/badge/License-Apache2-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0) [![Slack](https://img.shields.io/badge/Join-Slack-blue)](https://callforcode.org/slack) [![Website](https://img.shields.io/badge/View-Website-blue)](https://code-and-response.github.io/Project-Sample/)


## Contents

1. [Short description](#short-description)
1. [Demo video](#demo-video)
1. [The architecture](#the-architecture)
1. [Long description](#long-description)
1. [Project roadmap](#project-roadmap)
1. [Getting started](#getting-started)
1. [Running the tests](#running-the-tests)
1. [Live demo](#live-demo)
1. [Built with](#built-with)
1. [Contributing](#contributing)
1. [Versioning](#versioning)
1. [Authors](#authors)
1. [License](#license)
1. [Acknowledgments](#acknowledgments)

## Short description

### What's the problem?

Part of the World Health Organization's guidance on limiting further spread of COVID-19 is to practice social distancing. As a result of this financial institutions mainly banks and credit unions in most affected areas are taking precautionary measures by closing their facilities or reducing branch hours. Responses times to phone and email inquiries are longer than usual leading to increased anxiety and frustrations among customers. Information and guidelines by different goverment agencies changes by the hour in pandemic situations. Small businesses are at risk of closing due to COVID-19. 

Among many studies, one study suggests **18 million jobs at small businesses are at risk**
https://kenaninstitute.unc.edu/kenan-insight/the-covid-19-pandemic-and-small-business-employment/

We need alternate ways to help customers and small businesses in these times of crisis.

Real world problems:

<img src="https://github.com/arunwagle/Covid-19-Crisis-Communication-Finance/blob/master/design-docs/images/problem3.png" width="425"/> <img src="https://github.com/arunwagle/Covid-19-Crisis-Communication-Finance/blob/master/design-docs/images/problem2.png" width="425"/> 


### How can technology help?
> Banks have the opportunity for differentiated service  through use of AI. <img src="https://github.com/arunwagle/Covid-19-Crisis-Communication-Finance/blob/master/design-docs/images/solution1.png" width="425" align="center"/>

With the help of technology it is possible to create a platform which can provide easy access to information about banking services, payment services, small business administration and COVID-19 specific questions. With technology we can provide customers and small businesses with access to right set of tools and information to survive and flourish in this difficult times.


### The idea

> Providing a platform built using set of open source tools, backed by IBM Cloud and Watson Services, financial institutions can help people and small businesses with access to useful and frequently changing information. 

> This platform is totally extensible and is able to handle any pandemic situations.

> The idea is to be able to provide rapidly changing information from various goverment agencies as well as from the financial institutions in a matter of minutes.

> Omni channel experience including Web, Mobile, Voice, SMS and Slack.

> Roll out new content within hours by collaboration from business, content writers and technical teams.

> This pattern can be applied to any industry. 

With this platform, financial institutions can provide easy access to information on (few examples)
* Small Business Administration (SBA) 
  * SBA Relief Availability
  * SBA Relief Eligibility
  * SBA Available Services
  * SBA Paycheck Protection Program
* Payment Services
  * Defer Credit Card Payments
  * Defer Mortgage Payments
  * Credit Limit Inquiries
  * Use Home Equity To Pay Debts
  * Replace Cards
* Banking Services
  * Branch Locator
  * Branch Hours
  * Senior Customer Hours
  * FDIC Bank Find Tool
  * Deposit Checks Issues
  * Protect Against Fraud
  * Restricted Access To Bank Facilities
* CVOID-19 FAQ
  * Can I travel now?
  * Can I put on a mask ?
  * Is there a vaccine for COVID-19 ?
  * How will the IRS know where to send my payment?



## Demo video

### 4 minute video 

[![Watch the video](/design-docs/images/4min-video-screen.png)](https://ibm.box.com/s/r70btxeksmdzj9pt7sfhm95mismknjkg)

### [Detailed Presentation Video](https://ibm.box.com/s/jgp8lslqzqsj5rcrdfsm0qeohcf64vg2)

## The architecture

![Concecptual Architecture](/design-docs/images/conceptual-arc.png)

1. The user can interact with the virtual assistant using 
   1. Web
   1. Voice + SMS
   1. SMS
   1. Slack (Beta)
1. The voice and sms is configured through Twilio and Watson Voice Gateway integrations. This will use the speech to text and text to speech services to convert the conversations abck and foeth with the user.
1. The web version is a node.js cloud foundary application configured on the IBM Cloud. The web version can be accessed from mobile as well.
1. Watson Assistant is the virtual agent which is responsible for analyzing the intents of the user and respons appropriately.
1. Watson Assistant is configured with responses from 2 sources
   1. Specifically designed in the dialog flows 
   1. Watson Discovery which uses the Covid-19 FAQ extractors. This application gets information from DOL, Harvard Health, WHO, CDC, IRS on FAQ and is refreshed every day(can be configured to refresh every hour) to provide the latest updates.

### [Watson Assistant Design](/design-docs/wa-design.md)

### [Watson Discovery Design](/design-docs/wds-design.md)

## Long description

COVID-19 assistant for financial institutions is an omni channel virtual assistant. It will help the users of this application to get answers to frequently asked questions during crisis on topics of payments services, banking services small business administration relief and Covid-19. 
This application also gets information from DOL, Harvard Health, WHO, CDC, IRS on FAQ and is refreshed every day(can be configured to refresh every hour) to provide the latest updates. With this application we believe that financial customers can get realtime information without having to wait for a long time and small business owners can get assistance with CARES act and paycheck protection programs specific to their institutions as well as the policies of the government.

### [Detailed PDF](/design-docs/IBM-Watson-for-Banking-CallCenters-COVID-19-Final-Handout.pdf)

## Project roadmap

![Roadmap](/design-docs/images/Product%20Roadmap%20-%20Timeline_%20By%20Team.png)

### [Project Plan Link](/design-docs/images/Product%20Roadmap%20-%20Timeline_%20By%20Team.png) 


## Getting started
These instructions will help you deploy the virtual assistant on your IBM Cloud instance.

### High Level Steps

1. Create a free IBM Cloud Account
2. Setup IBM Services
   1. Watson Assistant 
   2. Watson Discovery
   3. Speech to Text
   4. Text to Speech
   5. Voice Agent with Watson
3. Deploy Web Application
4. Deploy Voice + SMS Virtual Assistant
5. Deploy SMS Virtual Assistant
6. Deploy Slack Virtual Assistant

#### [SETUP INSTRUCTIONS](setup/instructions.md)

## Running the tests

Once deployed, run the scripts. 
### [Demo Scripts Folder](/demo-scripts)

1. DemoScript-Covid-19-Finance-Web+Slack.docx
2. DemoScript-Covid-19-Finance-Voice+SMS.docx
3. DemoScript-Covid-19-Finance-SMS.docx

Live demo below can be used to test.


## Live demo

### [Live Application Screenshots](/design-docs/app-screens.md)


### [Detailed Presentation Video](https://ibm.box.com/s/jgp8lslqzqsj5rcrdfsm0qeohcf64vg2)

### Web
You can find a running system to test at https://generic-covid19-assistant.mybluemix.net/
Click on <img src="https://github.com/arunwagle/Covid-19-Crisis-Communication-Finance/blob/master/design-docs/images/chat-icon.png" width="50" height="50" /> to invoke the virtual assistant.

Run the scripts **/demo-scripts/DemoScript-Covid-19-Finance-Web+Slack.docx**

### Voice + SMS
Configured Twilio#: Call 214-480-4469
Run the scripts **/demo-scripts/DemoScript-Covid-19-Finance-Voice+SMS.docx**

### SMS
Configured Twilio#: Call 254-274-0066
Run the scripts **/demo-scripts/DemoScript-Covid-19-Finance-SMS.docx**

### SLACK
Please send an email to *arun.wagle@ibm.com* and we will add you to the workspace to test.
Once added you can run the scripts **/demo-scripts/DemoScript-Covid-19-Finance-Web+Slack.docx**


## Built with

### IBM Cloud Services
* [IBM Watson Assitant](https://cloud.ibm.com/catalog/services/watson-assistant) - Watson Assistant lets you build conversational interfaces into any application, device, or channel.
* [IBM Watson Discovery](https://cloud.ibm.com/catalog/services/discovery) - Watson Discovery adds a cognitive search and content analytics engine to applications.
* [IBM Voice Gateway](https://cloud.ibm.com/catalog/services/voice-agent-with-watson) - IBM® Voice Agent with Watson™ helps you integrate a set of orchestrated Watson services with the telephone network by using the Session Initiation Protocol (SIP).
* [IBM Watson Speech to Text](https://cloud.ibm.com/catalog/services/speech-to-text) - IBM® Speech to Text service transcribes audio to text to enable speech transcription capabilities for applications. 
* [IBM Watson Text to Speech](https://cloud.ibm.com/catalog/services/speech-to-text) - IBM Watson™ Text to Speech for IBM® Cloud Pak for Data converts written text to natural-sounding speech to provide speech-synthesis capabilities for applications. 
* [IBM Cloud Functions](https://cloud.ibm.com/functions/) - Functions-as-a-Service (FaaS) platform based on Apache OpenWhisk
* [IBM Node.js Cloud Foundary application](https://cloud.ibm.com/catalog/starters/cloud-foundry?runtime=sdk-for-nodejs) -Cloud Foundry automatically transforms source code into containers, scales them on demand, and manages user access and capacity.
* [IBM DevOps ](https://cloud.ibm.com/devops/toolchains) - Toolchains provide an integrated set of tools to build, deploy and manage your apps. You can create toolchains that include IBM Cloud services, open source tools, and third-party tools that make development and operations repeatable and easier to manage.

### External
* [Twilio](https://www.twilio.com/) - Customer engagement platform.


## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning.

## Authors

* **Arun Wagle** - *Project Lead* - (https://w3.ibm.com/bluepages/profile.html?uid=1J2509897)
* **Anjali Shah** - *Role: Technical SME* - (https://w3.ibm.com/bluepages/profile.html?uid=1J2706897)
* **Mark Romagna** - *Role: Business* - (https://w3.ibm.com/bluepages/profile.html?uid=0G1028897)
* **Mark Romagna** - *Role: Business* - (https://w3.ibm.com/bluepages/profile.html?uid=9D0586897)


## License

This project is licensed under the Apache 2 License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

* TODO
